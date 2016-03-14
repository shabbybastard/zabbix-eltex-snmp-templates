<?php
error_reporting(E_ALL);
ini_set('display_errors', 'Off');
function view_include($fileName, $vars = array())
{
    // Setting variables for the template.
    foreach ($vars as $k => $v)
    {
        $$k = $v;
    }

    // Generate HTML string.
    ob_start();
    //The function connects the files from the theme folder
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
	if($_POST['vendor'] == 'eltex')
    {
		if($_POST['1g'] > 100 || $_POST['10g'] > 100) exit;
        for($p = 49; $p <= $_POST['1g']; $p++)
        {
			$arPorts['GE ' . $p] = sprintf('100%02d', $p);
		}
		
		for($p = 105; $p <= $_POST['10g']; $p++)
        {
			$arPorts['10GE ' . $p] = sprintf('101%02d', $p);
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
        $eltex_items = view_include('eltex_items.tpl', $info);;
        $eltex_triggers = view_include('eltex_triggers.tpl', $info);;
        $eltex_graphs = view_include('eltex_graphs.tpl', $info);;
    }
    else
    {
        $eltex_items = '';
        $eltex_triggers = '';
        $eltex_graphs = '';
    }
    $info = array(
                    'community' => $_POST['community'],
                    'delay' => $_POST['interval'],
                    'tpl_name' => $_POST['name'],
                    'eltex_items' => $eltex_items,
                    'eltex_triggers' => $eltex_triggers,
                    'eltex_graphs' => $eltex_graphs,
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
/*Yes, I know that JQuery here is like use a sledge-hammer to crack a nut. */
google.load("jquery", "1.7");
google.setOnLoadCallback(function() {
    $(function() {
        $('#mixed_ports').hide();
        $('input[name=vendor]').change(function() {
            if($('input[name=vendor]:checked').val() == 'eltex')
            {
                $('#eltex_feat').show();
                $('#mixed_ports').hide();
				$('#eltex_triggers').show();
                $('#eltex_ports').show();                
            }
            else
            {
                $('#eltex_feat').hide();
                $('#eltex_ports').hide();
				$('#eltex_triggers').hide();
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
Template name <input type="text" name="name" value="Eltex"><br>
Vendor <input type="radio" name="vendor" value="eltex" checked id="eltex"> <label for="eltex">Eltex</label> <input type="radio" name="vendor" value="junk" id="junk"> <label for="junk">Other</label><br>
<div id="eltex_ports">
Number of 1G ports <input type="text" name="1g" size="2"><br>
Number of 10G ports <input type="text" name="10g" size="2"><br>
<!-- There are 10g ethernet and 10G  -->
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
<div id="eltex_feat">
<input type="checkbox" name="monitor" id="monitor"> <label for="monitor">Get CPU usage and temperature status</label>
</div>

<h2>Triggers</h2>
<input type="checkbox" name="tgport" id="tgport"> <label for="tgport">Port is down</label><br>
In/out errors on port &gt; <input type="text" name="errorstreshold" value="" size="2"><br>
<div id="eltex_triggers">
CPU load &gt; <input type="text" name="cputreshold" value="80" size="2">%<br>
<!-- Memory load &gt; <input type="text" name="memorytreshold" value="" size="3">Mb<br> --> <!-- Eltex don't provide memory usage -->
</div>
<input type="submit" value="Generate template">
</form>
</body>
</html>

<?php
}
?>