        <trigger>
          <description>Port <?=$port_name ?> errors detected on {HOSTNAME}</description>
          <type>0</type>
          <expression>{<?=$tpl_name ?>:ifInErrors.<?=$port_number ?>.last(0)}&gt;<?=$error_treshold ?>|{<?=$tpl_name ?>:ifOutErrors.<?=$port_number ?>.last(0)}&gt;<?=$error_treshold ?></expression>
          <url></url>
          <status>0</status>
          <priority>1</priority>
          <comments></comments>
        </trigger>