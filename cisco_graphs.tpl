			<graph name="Load" width="900" height="200">
			  <ymin_type>0</ymin_type>
			  <ymax_type>0</ymax_type>
			  <ymin_item_key></ymin_item_key>
			  <ymax_item_key></ymax_item_key>
			  <show_work_period>0</show_work_period>
			  <show_triggers>1</show_triggers>
			  <graphtype>0</graphtype>
			  <yaxismin>0.0000</yaxismin>
			  <yaxismax>100.0000</yaxismax>
			  <show_legend>0</show_legend>
			  <show_3d>0</show_3d>
			  <percent_left>0.0000</percent_left>
			  <percent_right>0.0000</percent_right>
			  <graph_elements>
				<graph_element item="<?=$tpl_name ?>:memoryUsage">
				  <drawtype>0</drawtype>
				  <sortorder>0</sortorder>
				  <color>009900</color>
				  <yaxisside>0</yaxisside>
				  <calc_fnc>2</calc_fnc>
				  <type>0</type>
				  <periods_cnt>5</periods_cnt>
				</graph_element>
				<graph_element item="<?=$tpl_name ?>:cpuUsage">
				  <drawtype>0</drawtype>
				  <sortorder>1</sortorder>
				  <color>990000</color>
				  <yaxisside>1</yaxisside>
				  <calc_fnc>2</calc_fnc>
				  <type>0</type>
				  <periods_cnt>5</periods_cnt>
				</graph_element>
			  </graph_elements>
			</graph>