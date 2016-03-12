        <trigger>
          <description>Port <?=$port_name ?> errors detected on {HOSTNAME}</description>
          <type>0</type>
          <expression>{<?=$tpl_name ?>:ifInErrors.<?=$port_number ?>.last(0)}&gt;1|{<?=$tpl_name ?>:ifOutErrors.<?=$port_number ?>.last(0)}&gt;1</expression>
          <url></url>
          <status>0</status>
          <priority>1</priority>
          <comments></comments>
        </trigger>
        <trigger>
          <description>Port <?=$port_name ?> status down on {HOSTNAME}</description>
          <type>0</type>
          <expression>{<?=$tpl_name ?>:ifOperStatus.<?=$port_number ?>.last(0)}=2</expression>
          <url></url>
          <status>0</status>
          <priority>1</priority>
          <comments></comments>
        </trigger>