/**
 * Ajax 三级省市联动
 *
 * settings 参数说明
 *	-----
 *	url:省市数据josn文件路径
 *	province:默认省份ID
 *	city:默认城市ID
 *	dist:默认地区（县）ID
 *	nodata:无数据状态
 *	required:必选项
 *  -----
 */

(function($){
	$.fn.citySelect=function(settings){
		if(this.length<1){return;};

		// 默认值
		settings=$.extend({
			url:"js/city.min.js",
			prov:null,
			city:null,
			dist:null,
			nodata:null,
			required:true,
			callback: function(){}
		},settings);

		var box_obj=this;
		var prov_obj=box_obj.find(".province");
		var city_obj=box_obj.find(".city");
		var dist_obj=box_obj.find(".district");
		var prov_val=settings.prov;
		var city_val=settings.city;
		var dist_val=settings.dist;
		var select_prehtml=(settings.required) ? "" : "<option value=''>请选择</option>";
		var select_province_html = (settings.required) ? "" : "<option value=''>≡ 请选择省 ≡</option>";
		var select_city_html = (settings.required) ? "" : "<option value=''>≡ 请选择市 ≡</option>";
		var select_district_html = (settings.required) ? "" : "<option value=''>≡ 请选择区 ≡</option>";
		
		var city_json;

		// 赋值市级函数
		var cityStart=function(){
			//var prov_id=prov_obj.get(0).selectedIndex;
			var prov_id = prov_obj.val();
			var prov_id = prov_obj.find("option:selected").val(); 
			if(!settings.required){
				//prov_id--;
			};
			city_obj.empty().attr("disabled",true);
			dist_obj.empty().attr("disabled",true);
			
			/*
			if(prov_id<0||typeof(city_json.citylist[prov_id].c)=="undefined"){
				if(settings.nodata=="none"){
					city_obj.css("display","none");
					dist_obj.css("display","none");
				}else if(settings.nodata=="hidden"){
					city_obj.css("visibility","hidden");
					dist_obj.css("visibility","hidden");
				};
				return;
			};
			*/
			
			// 遍历赋值市级下拉列表
			temp_html=select_city_html;
			$.each(city_json,function(i,city){
				if (city.parent_id == prov_id) {
					temp_html+="<option value='"+city.region_id+"'>"+city.region_name+"</option>";
				}
			});
			city_obj.html(temp_html).attr("disabled",false).css({"display":"","visibility":""});
			distStart();

		};

		// 赋值地区（县）函数
		var distStart=function(){
			//var prov_id=prov_obj.get(0).selectedIndex;
			var prov_id = prov_obj.val();
			//var city_id=city_obj.get(0).selectedIndex;
			var city_id = city_obj.val();
			if(!settings.required){
				//prov_id--;
				//city_id--;
			};
			dist_obj.empty().attr("disabled",true);

			/*
			if(prov_id<0||city_id<0||typeof(city_json.citylist[prov_id].c[city_id].a)=="undefined"){
				if(settings.nodata=="none"){
					dist_obj.css("display","none");
				}else if(settings.nodata=="hidden"){
					dist_obj.css("visibility","hidden");
				};
				return;
			};
			*/
			
			// 遍历赋值市级下拉列表
			temp_html=select_district_html;
			$.each(city_json,function(i,dist){
				if (dist.parent_id == city_id) {
					temp_html+="<option value='"+dist.region_id+"'>"+dist.region_name+"</option>";
				}
				
			});
			dist_obj.html(temp_html).attr("disabled",false).css({"display":"","visibility":""});
		};

		var init=function(){
			// 遍历赋值省份下拉列表
			temp_html=select_province_html;
			$.each(city_json,function(i,prov){
				if (prov.parent_id == 1) {
					temp_html+="<option value='"+prov.region_id+"'>"+prov.region_name+"</option>";
				}
			});
			prov_obj.html(temp_html);

			// 若有传入省份与市级的值，则选中。（setTimeout为兼容IE6而设置）
			setTimeout(function(){
				if(settings.province!=null){
					prov_obj.val(settings.province);
					cityStart();
					setTimeout(function(){
						if(settings.city!=null){
							city_obj.val(settings.city);
							distStart();
							setTimeout(function(){
								if(settings.district!=null){
									dist_obj.val(settings.district);
								};
							},1);
							settings.callback.call(this,box_obj);
						};
					},1);
				};
			},1);

			// 选择省份时发生事件
			prov_obj.bind("change",function(){
				cityStart();
				settings.callback.call(this,box_obj);
			});

			// 选择市级时发生事件
			city_obj.bind("change",function(){
				distStart();
				settings.callback.call(this,box_obj);
			});
			
			
			settings.callback.call(this,box_obj);
		};


		// 设置省市json数据
		if(typeof(settings.url)=="string"){
			$.getJSON(settings.url,function(json){
				city_json=json;
				init();
			});
		}else{
			city_json=settings.url;
			init();
		};
	};
})(jQuery);