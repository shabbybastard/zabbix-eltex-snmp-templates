		<trigger>
          <description>CPU load is too high on {HOSTNAME}</description>
          <type>0</type>
          <expression>{<?=$tpl_name ?>:cpuUsage.last(0)}&gt;<?=$cpu_limit ?></expression>
          <url></url>
          <status>0</status>
          <priority>3</priority>
          <comments></comments>
        </trigger>
        <trigger>
          <description>Memory usage is too high on {HOSTNAME}</description>
          <type>0</type>
          <expression>{<?=$tpl_name ?>:memoryUsage.last(0)}&gt;<?=$memory_limit ?></expression>
          <url></url>
          <status>0</status>
          <priority>3</priority>
          <comments></comments>
        </trigger>
        <trigger>
          <description>Temperature critical on {HOSTNAME}</description>
          <type>0</type>
          <expression>{<?=$tpl_name ?>:temperatureStatus.last(0)}=3</expression>
          <url></url>
          <status>0</status>
          <priority>4</priority>
          <comments></comments>
        </trigger>
        <trigger>
          <description>Temperature warning on {HOSTNAME}</description>
          <type>0</type>
          <expression>{<?=$tpl_name ?>:temperatureStatus.last(0)}&gt;1</expression>
          <url></url>
          <status>0</status>
          <priority>3</priority>
          <comments></comments>
        </trigger>