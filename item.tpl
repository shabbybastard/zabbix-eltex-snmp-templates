        <item type="4" key="ifOperStatus.<?=$port_number ?>" value_type="3">
          <description>Status port <?=$port_name ?></description>
          <ipmi_sensor></ipmi_sensor>
          <delay><?=$delay ?></delay>
          <history>7</history>
          <trends>365</trends>
          <status>0</status>
          <data_type>0</data_type>
          <units></units>
          <multiplier>0</multiplier>
          <delta>0</delta>
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
          <snmp_oid>1.3.6.1.2.1.2.2.1.8.<?=$port_number ?></snmp_oid>
          <snmp_port>161</snmp_port>
          <snmpv3_securityname></snmpv3_securityname>
          <snmpv3_securitylevel>0</snmpv3_securitylevel>
          <snmpv3_authpassphrase></snmpv3_authpassphrase>
          <snmpv3_privpassphrase></snmpv3_privpassphrase>
          <valuemapid>0</valuemapid>
          <applications/>
        </item>
		<item type="4" key="ifOutOctets.<?=$port_number ?>" value_type="3">
          <description>Bytes Tx port <?=$port_name ?></description>
          <ipmi_sensor></ipmi_sensor>
          <delay><?=$delay ?></delay>
          <history>7</history>
          <trends>365</trends>
          <status>0</status>
          <data_type>0</data_type>
          <units>bps</units>
          <multiplier>1</multiplier>
          <delta>1</delta>
          <formula>8</formula>
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
          <snmp_oid>1.3.6.1.2.1.2.2.1.16.<?=$port_number ?></snmp_oid>
          <snmp_port>161</snmp_port>
          <snmpv3_securityname></snmpv3_securityname>
          <snmpv3_securitylevel>0</snmpv3_securitylevel>
          <snmpv3_authpassphrase></snmpv3_authpassphrase>
          <snmpv3_privpassphrase></snmpv3_privpassphrase>
          <valuemapid>0</valuemapid>
          <applications/>
        </item>
		<item type="4" key="ifInOctets.<?=$port_number ?>" value_type="3">
          <description>Bytes Rx port <?=$port_name ?></description>
          <ipmi_sensor></ipmi_sensor>
          <delay><?=$delay ?></delay>
          <history>7</history>
          <trends>365</trends>
          <status>0</status>
          <data_type>0</data_type>
          <units>bps</units>
          <multiplier>1</multiplier>
          <delta>1</delta>
          <formula>8</formula>
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
          <snmp_oid>1.3.6.1.2.1.2.2.1.10.<?=$port_number ?></snmp_oid>
          <snmp_port>161</snmp_port>
          <snmpv3_securityname></snmpv3_securityname>
          <snmpv3_securitylevel>0</snmpv3_securitylevel>
          <snmpv3_authpassphrase></snmpv3_authpassphrase>
          <snmpv3_privpassphrase></snmpv3_privpassphrase>
          <valuemapid>0</valuemapid>
          <applications/>
        </item>
		<item type="4" key="ifOutBroadcastPkts.<?=$port_number ?>" value_type="3">
          <description>Broadcast packets Tx port <?=$port_name ?></description>
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
          <snmp_oid>1.3.6.1.2.1.31.1.1.1.5.<?=$port_number ?></snmp_oid>
          <snmp_port>161</snmp_port>
          <snmpv3_securityname></snmpv3_securityname>
          <snmpv3_securitylevel>0</snmpv3_securitylevel>
          <snmpv3_authpassphrase></snmpv3_authpassphrase>
          <snmpv3_privpassphrase></snmpv3_privpassphrase>
          <valuemapid>0</valuemapid>
          <applications/>
        </item>
		<item type="4" key="ifInBroadcastPkts.<?=$port_number ?>" value_type="3">
          <description>Broadcast packets Rx port <?=$port_name ?></description>
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
          <snmp_oid>1.3.6.1.2.1.31.1.1.1.3.<?=$port_number ?></snmp_oid>
          <snmp_port>161</snmp_port>
          <snmpv3_securityname></snmpv3_securityname>
          <snmpv3_securitylevel>0</snmpv3_securitylevel>
          <snmpv3_authpassphrase></snmpv3_authpassphrase>
          <snmpv3_privpassphrase></snmpv3_privpassphrase>
          <valuemapid>0</valuemapid>
          <applications/>
        </item>
		<item type="4" key="ifOutErrors.<?=$port_number ?>" value_type="3">
          <description>Errors Tx port <?=$port_name ?></description>
          <ipmi_sensor></ipmi_sensor>
          <delay><?=$delay ?></delay>
          <history>7</history>
          <trends>365</trends>
          <status>0</status>
          <data_type>0</data_type>
          <units></units>
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
          <snmp_oid>1.3.6.1.2.1.2.2.1.20.<?=$port_number ?></snmp_oid>
          <snmp_port>161</snmp_port>
          <snmpv3_securityname></snmpv3_securityname>
          <snmpv3_securitylevel>0</snmpv3_securitylevel>
          <snmpv3_authpassphrase></snmpv3_authpassphrase>
          <snmpv3_privpassphrase></snmpv3_privpassphrase>
          <valuemapid>0</valuemapid>
          <applications/>
        </item>
		<item type="4" key="ifInErrors.<?=$port_number ?>" value_type="3">
          <description>Errors Rx port <?=$port_name ?></description>
          <ipmi_sensor></ipmi_sensor>
          <delay><?=$delay ?></delay>
          <history>7</history>
          <trends>365</trends>
          <status>0</status>
          <data_type>0</data_type>
          <units></units>
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
          <snmp_oid>1.3.6.1.2.1.2.2.1.14.<?=$port_number ?></snmp_oid>
          <snmp_port>161</snmp_port>
          <snmpv3_securityname></snmpv3_securityname>
          <snmpv3_securitylevel>0</snmpv3_securitylevel>
          <snmpv3_authpassphrase></snmpv3_authpassphrase>
          <snmpv3_privpassphrase></snmpv3_privpassphrase>
          <valuemapid>0</valuemapid>
          <applications/>
        </item>

		