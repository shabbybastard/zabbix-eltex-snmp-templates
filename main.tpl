<zabbix_export version="1.0" date="<?=$date ?>" time="<?=$time ?>">
  <hosts>
    <host name="<?=$tpl_name ?>">
      <proxy_hostid>0</proxy_hostid>
      <useip>1</useip>
      <dns></dns>
      <ip>127.0.0.1</ip>
      <port>10050</port>
      <status>3</status>
      <useipmi>0</useipmi>
      <ipmi_ip>127.0.0.1</ipmi_ip>
      <ipmi_port>623</ipmi_port>
      <ipmi_authtype>0</ipmi_authtype>
      <ipmi_privilege>2</ipmi_privilege>
      <ipmi_username></ipmi_username>
      <ipmi_password></ipmi_password>
      <groups>
        <group>Templates</group>
      </groups>   
	  <items>
        <item type="4" key="Uptime" value_type="3">
          <description>Uptime</description>
          <ipmi_sensor></ipmi_sensor>
          <delay><?=$delay ?></delay>
          <history>90</history>
          <trends>365</trends>
          <status>0</status>
          <data_type>0</data_type>
          <units>s</units>
          <multiplier>1</multiplier>
          <delta>0</delta>
          <formula>0.01</formula>
          <lastlogsize>0</lastlogsize>
          <logtimefmt></logtimefmt>
          <delay_flex></delay_flex>
          <authtype>0</authtype>
          <username></username>
          <password></password>
          <publickey></publickey>
          <privatekey></privatekey>
          <params></params>
          <trapper_hosts></trapper_hosts>
          <snmp_community><?=$community ?></snmp_community>
          <snmp_oid>.1.3.6.1.2.1.1.3.0</snmp_oid>
          <snmp_port>161</snmp_port>
          <snmpv3_securityname></snmpv3_securityname>
          <snmpv3_securitylevel>0</snmpv3_securitylevel>
          <snmpv3_authpassphrase></snmpv3_authpassphrase>
          <snmpv3_privpassphrase></snmpv3_privpassphrase>
          <valuemapid>0</valuemapid>
          <applications/>
        </item>
	   <?=$cisco_items ?>
	   <?=$items ?>
	  </items>
	  <templates/>
	  <triggers>	  
		<trigger>
          <description>{HOSTNAME} has just been restarted</description>
          <type>0</type>
          <expression>{<?=$tpl_name ?>:Uptime.last(0)}&lt;600</expression>
          <url></url>
          <status>0</status>
          <priority>3</priority>
          <comments></comments>
        </trigger>
	   <?=$cisco_triggers ?>
	   <?=$triggers ?>
	  </triggers>
	  <graphs>
       <?=$cisco_graphs ?>
	   <?=$graphs ?>
	  </graphs>
      <macros/>
    </host>
  </hosts>
  <dependencies/>
</zabbix_export>
