		<item type="4" key="ifOutUcastPkts.<?=$port_number ?>" value_type="3">
          <description>Unicast packets Tx port <?=$port_name ?></description>
          <ipmi_sensor></ipmi_sensor>
          <delay><?=$delay ?></delay>
          <history>7</history>
          <trends>365</trends>
          <status>0</status>
          <data_type>0</data_type>
          <units>pps</units>
          <multiplier>0</multiplier>
          <delta>1</delta>
          <formula></formula>
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
          <snmp_oid>1.3.6.1.2.1.2.2.1.17.<?=$port_number ?></snmp_oid>
          <snmp_port>161</snmp_port>
          <snmpv3_securityname></snmpv3_securityname>
          <snmpv3_securitylevel>0</snmpv3_securitylevel>
          <snmpv3_authpassphrase></snmpv3_authpassphrase>
          <snmpv3_privpassphrase></snmpv3_privpassphrase>
          <valuemapid>0</valuemapid>
          <applications/>
        </item>
		<item type="4" key="ifInUcastPkts.<?=$port_number ?>" value_type="3">
          <description>Unicast packets Rx port <?=$port_name ?></description>
          <ipmi_sensor></ipmi_sensor>
          <delay><?=$delay ?></delay>
          <history>7</history>
          <trends>365</trends>
          <status>0</status>
          <data_type>0</data_type>
          <units>pps</units>
          <multiplier>0</multiplier>
          <delta>1</delta>
          <formula></formula>
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
          <snmp_oid>1.3.6.1.2.1.2.2.1.11.<?=$port_number ?></snmp_oid>
          <snmp_port>161</snmp_port>
          <snmpv3_securityname></snmpv3_securityname>
          <snmpv3_securitylevel>0</snmpv3_securitylevel>
          <snmpv3_authpassphrase></snmpv3_authpassphrase>
          <snmpv3_privpassphrase></snmpv3_privpassphrase>
          <valuemapid>0</valuemapid>
          <applications/>
        </item>