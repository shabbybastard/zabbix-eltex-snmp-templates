<?php
error_reporting(E_ALL);
ini_set('display_errors', 'On');
function view_include($fileName, $vars = array())
{
    // Установка переменных для шаблона.
    foreach ($vars as $k => $v)
    {
        $$k = $v;
    }

    // Генерация HTML в строку.
    ob_start();
    //Функция подключает файлы из папки theme
    include $fileName;
    return ob_get_clean();	
}

    
if(!empty($_POST))
{
    header("Cache-Control: no-cache, must-revalidate");
    header("Expires: Sat, 26 Jul 1997 05:00:00 GMT");
    header('Content-Disposition: attachment; filename="' . $_POST['name'] . '_zabbix_template.xml"');
    
    $items = '';
    $graphs = '';
    $triggers = '';
    
    $_POST['memorytreshold'] *= 1048576;

	$arPorts = array();
	if($_POST['vendor'] == 'cisco')
    {
		if($_POST['100m'] > 100 || $_POST['1g'] > 100) exit;
        for($p = 1; $p <= $_POST['100m']; $p++)
        {
			$arPorts['FE ' . $p] = sprintf('100%02d', $p);
		}
		
		for($p = 1; $p <= $_POST['1g']; $p++)
        {
			$arPorts['GE ' . $p] = sprintf('101%02d', $p);
		}
	}
	else
	{
		if($_POST['mixed_ports'] > 100) exit;
		for($p = 1; $p <= $_POST['mixed_ports']; $p++)
        {
			$arPorts[$p] = $p;
		}
	}
	
	foreach($arPorts as $portName => $portID)
	{
		$info = array(
					'port_number' => $portID,
					'port_name' => $portName,
					'community' => $_POST['community'],
					'delay' => $_POST['interval'],
					'tpl_name' => $_POST['name'],
					'error_treshold' => $_POST['errorstreshold']);
						
		$graphElements = '';
		
		if($_POST['itstatus'] || $_POST['tgport'])
		{
			$items .= view_include('item_status.tpl', $info);
		}
			
		if($_POST['itbytes'])
		{
			$items .= view_include('item_octets.tpl', $info);
			$graphElements .= view_include('graph_octets.tpl', $info);
		}
			
		if($_POST['iterrors'] || $_POST['error_treshold'])
		{
			$items .= view_include('item_errors.tpl', $info);
			$graphElements .= view_include('graph_errors.tpl', $info);
		}
			
		if($_POST['itbroadcast'])
		{
			$items .= view_include('item_broadcast.tpl', $info);
			$graphElements .= view_include('graph_broadcast.tpl', $info);
		}
			
		if($_POST['itunicast'])
		{
			$items .= view_include('item_unicast.tpl', $info);
			$graphElements .= view_include('graph_unicast.tpl', $info);
		}
			
		if($_POST['itmulticast'])
		{
			$items .= view_include('item_multicast.tpl', $info);
			$graphElements .= view_include('graph_multicast.tpl', $info);
		}
		
		if($_POST['tgport'])
		{
			$triggers .= view_include('trigger_port_status.tpl', $info);
		}
		
		if($_POST['errorstreshold'])
		{
			$triggers .= view_include('trigger_port_errors.tpl', $info);
		}
			
		$graphs .= view_include('graph.tpl', array('graph_elements' => $graphElements, 'port_name' => $portName));
	} 
    
    
    if(!empty($_POST['monitor']))
    {
        $info = array(
                    'community' => $_POST['community'],
                    'delay' => $_POST['interval'],
                    'tpl_name' => $_POST['name'],
                    'cpu_limit' => $_POST['cputreshold'],
                    'memory_limit' => $_POST['memorytreshold']);
        $cisco_items = view_include('cisco_items.tpl', $info);;
        $cisco_triggers = view_include('cisco_triggers.tpl', $info);;
        $cisco_graphs = view_include('cisco_graphs.tpl', $info);;
    }
    else
    {
        $cisco_items = '';
        $cisco_triggers = '';
        $cisco_graphs = '';
    }
    $info = array(
                    'community' => $_POST['community'],
                    'delay' => $_POST['interval'],
                    'tpl_name' => $_POST['name'],
                    'cisco_items' => $cisco_items,
                    'cisco_triggers' => $cisco_triggers,
                    'cisco_graphs' => $cisco_graphs,
                    'date' => date('d.m.y'),
                    'time' => date('H.i'),
                    'items' => $items,
                    'triggers' => $triggers,
                    'graphs' => $graphs);
    
    echo '<?xml version="1.0" encoding="UTF-8"?>';
    echo view_include('main.tpl', $info); 
}
else
{
?>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript">
/* Да, я знаю, что JQuery тут - как из пушки по воробьям... */
google.load("jquery", "1.7");
google.setOnLoadCallback(function() {
    $(function() {
        $('#mixed_ports').hide();
        $('input[name=vendor]').change(function() {
            if($('input[name=vendor]:checked').val() == 'cisco')
            {
                $('#cisco_feat').show();
                $('#mixed_ports').hide();
				$('#cisco_triggers').show();
                $('#cisco_ports').show();                
            }
            else
            {
                $('#cisco_feat').hide();
                $('#cisco_ports').hide();
				$('#cisco_triggers').hide();
                $('#mixed_ports').show();
            }
        });
    });
});
</script>
<title>Zabbix template generator for switches</title>
</head>
<body>
<h1>Zabbix template generator for switches</h1>
<form method="post">
Template name <input type="text" name="name" value="Cisco_Catalyst"><br>
Vendor <input type="radio" name="vendor" value="cisco" checked id="cisco"> <label for="cisco">Cisco</label> <input type="radio" name="vendor" value="junk" id="junk"> <label for="junk">Other</label><br>
<div id="cisco_ports">
Number of 100M ports <input type="text" name="100m" size="2"><br>
Number of 1G ports <input type="text" name="1g" size="2"><br>
</div>
<div id="mixed_ports">
Number of ports <input type="text" name="mixed_ports"><br>
</div>
SNMP community <input type="text" name="community"><br>
Check interval (sec) <input type="text" name="interval" value="60" size="3"><br>

<h2>Items</h2>
<input type="checkbox" name="itstatus" id="itstatus" checked> <label for="itstatus">Port status</label><br>
<input type="checkbox" name="itbytes" id="itbytes" checked> <label for="itbytes">In/out bytes/s</label><br>
<input type="checkbox" name="iterrors" id="iterrors" checked> <label for="iterrors">Errors</label><br>
<input type="checkbox" name="itbroadcast" id="itbroadcast" checked> <label for="itbroadcast">Broadcast packets</label><br>
<input type="checkbox" name="itunicast" id="itunicast"> <label for="itunicast">Unicast packets</label><br>
<input type="checkbox" name="itmulticast" id="itmulticast"> <label for="itmulticast">Multicast packets</label><br>
<div id="cisco_feat">
<input type="checkbox" name="monitor" id="monitor"> <label for="monitor">Get CPU and memory usage, temperature status</label>
</div>

<h2>Triggers</h2>
<input type="checkbox" name="tgport" id="tgport"> <label for="tgport">Port is down</label><br>
In/out errors on port &gt; <input type="text" name="errorstreshold" value="" size="2"><br>
<div id="cisco_triggers">
CPU load &gt; <input type="text" name="cputreshold" value="80" size="2">%<br>
Memory load &gt; <input type="text" name="memorytreshold" value="" size="3">Mb<br>
</div>
<input type="submit" value="Generate template">
</form>
</body>
</html>
<?php
}
?>