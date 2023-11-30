function pano1(){
	_this = this;
	_this.visible = false;
	this.krpano1 = null;
	this.onloadComplete = false;
}

var isOpen = "F";
pano1.prototype = {
	"init" : function(){	
		webcall("여기서 호출한다.");
		embedpano({
			swf : "https://www.gallery360.co.kr/vr/vr/tour.swf",
			id : "krpanoSWFObject_" + __key, 
			xml : "https://www.gallery360.co.kr/vr/vr/xml/tour_" + __key + ".xml?open&ver="+new Date().getTime(),
			target : "pano1", 
			consolelog : true,					
			passQueryParameters : true, 		
			onready : __pano1.krpano_onready_callback
		});

	},
	
	"krpano_onready_callback" : function(krpano_interface){
		__pano1.krpano1 = krpano_interface;
		__pano1.krpano1.set('events.onloadcomplete', 'js(__pano1.loadComplete());');
		//setTimeout("__pano1.load_icon()", 2000);
		
		// 롤오버 텍스트 효과 수정
		__pano1.krpano1.call('set(textstyle[STYLE1_LinkSM].font, "Noto Sans KR")');
		__pano1.krpano1.call('set(textstyle[STYLE1_LinkSM].padding, "8 20 8")');
		__pano1.krpano1.call('set(textstyle[STYLE1_LinkSM].yoffset, "60")');
		__pano1.krpano1.call('set(textstyle[STYLE1_LinkSM].backgroundalpha, "0.8")');
		__pano1.krpano1.call('set(textstyle[STYLE1_LinkSM].backgroundcolor, "0x000000")');
		
		__pano1.insertCopyright();
	},
	
	"insertCopyright":function(){
		return false;
		var _html = '<div class="vr_copyright">'+g360.g_lang.VR_Copyright+'</div>';
		$('#pano1').append(_html);
	},
	"viewCountUp" : function(){
		var hotspot_nm = '';
		$.each(__pano1.krpano1.get('hotspot').getArray(), function(){
			if (this.title == 'view_cnt') {
				hotspot_nm = this.name;
				return false;
			}
		});
		
		if (hotspot_nm) {
			var settings = {
					from: 0,
					to: viewcount,
					speed: 1000,
					refreshInterval: 100,
					decimals: 0,
					formatter: function(value, settings) {
						return value.toFixed(settings.decimals).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					},
					onUpdate: null,
					onComplete: null
			};
			
			var loops = Math.ceil(settings.speed / settings.refreshInterval),
				increment = (settings.to - settings.from) / loops;
			
			var	loopCount = 0,
				value = settings.from;
				
			if (window.viewcnt_interval) {
				clearInterval(window.viewcnt_interval);
			}
			window.viewcnt_interval = setInterval(updateTimer, settings.refreshInterval);
	
			render(value);
	
			function updateTimer() {
				value += increment;
				loopCount++;
	
				render(value);
	
				if (loopCount >= loops) {
					clearInterval(window.viewcnt_interval);
					value = settings.to;
				}
			}
	
			function render(value) {
				var formattedValue = settings.formatter.call(this, value, settings);
				__pano1.krpano1.set('hotspot[' + hotspot_nm + '].html', formattedValue);
			}
			
						
		}
	},
	"loadComplete" : function(){	
		
		isOpen = "T";
		$("#vr_load").hide();
		
		// 롤오버 텍스트 효과 수정
		__pano1.krpano1.call('set(textstyle[STYLE1_LinkSM].font, "Noto Sans KR")');
		__pano1.krpano1.call('set(textstyle[STYLE1_LinkSM].padding, "8 20 8")');
		__pano1.krpano1.call('set(textstyle[STYLE1_LinkSM].yoffset, "60")');
		__pano1.krpano1.call('set(textstyle[STYLE1_LinkSM].backgroundalpha, "0.8")');
		__pano1.krpano1.call('set(textstyle[STYLE1_LinkSM].backgroundcolor, "0x000000")');
			
		// 비디오 재생중일 때 사운드 중지
		if (__pano1.krpano1.get('action[video_openAdhs]')) {
			__pano1.krpano1.set('action[video_openAdhs].content', 'pausesound(bgsnd);\n' + __pano1.krpano1.get('action[video_openAdhs]').content);				
		}
		if (__pano1.krpano1.get('action[videoplayer_close]')) {
			__pano1.krpano1.set('action[videoplayer_close].content', __pano1.krpano1.get('action[videoplayer_close]').content + "if(get(layer[snd2].crop) == '0|0|50|50', resumesound(bgsnd));");				
		}
		__pano1.krpano1.set('layer[volume_finger].visible', false);
		__pano1.krpano1.set('layer[close_freim_url_addhs].width', 30);
		__pano1.krpano1.set('action[iframe_add_hotspot].content',"\n\tif(webvr.isenabled,,\n\t\taddlayer(freim_bg_Adhs);\n\t\tlayer[freim_bg_Adhs].loadstyle(freim_bg_Adhs);\n\t\ttween(layer[freim_bg_Adhs].alpha, 1);\n\t\tset(layer[fon_zad_plan_adhs].enabled, true);\n\t\ttween(layer[fon_zad_plan_adhs].alpha, 1);\n\t\tset(closA,%1);\n\t\tremovelayer(%1);\n\t\taddlayer(%1);\n\t\tlayer[%1].loadstyle(frame_html);\n\t\tset(layer[%1].parent, %2);\n\t\tset(layer[close_freim_url_addhs].parent, %1);\n\t\tset(layer[close_freim_url_addhs].onclick, \tset(visible,false);\n\t\t\t\t\t\t\t\t\tremovelayer(%1);\n\t\t\t\t\t\t\t\t\ttween(layer[freim_bg_Adhs].alpha, 0);\n\t\t\t\t\t\t\t\t\tset(layer[fon_zad_plan_adhs].enabled, false);\n\t\t\t\t\t\t\t\t\ttween(layer[fon_zad_plan_adhs].alpha, 0);\n\t\t\t\t\t\t\t\t\tdelayedcall(0.3,removelayer(freim_bg_Adhs););\n\t\t\t);\n\t\tset(layer[close_freim_url_addhs].visible, true);\n\t\ttween(layer[%1].alpha, 1);\n\t\tset(layer[freim_bg_Adhs].onclick, callwith(layer[close_freim_url_addhs], onclick); );\n\t\tif(device.html5,\n\t      if(device.ios,\t\n\t\t\t\tset(iPad_hs1,'[div style=\"position:absolute; right:0; bottom:0; left:0; top:0; overflow-y: scroll; -webkit-overflow-scrolling:touch;\"]');\n\t\t\t\tset(iPad_hs2,'[/div]'); \n\t\t\t\t,\n\t\t\t\tset(iPad_hs1,'');\n\t\t\t\tset(iPad_hs2,'');\n\t\t\t );\n\t\t\ttxtadd(iframecode,get(iPad_hs1),'[iframe  id=\"krpano_iframe_'\n\t\t\t\t\t\t  ,%1,'\" width=\"100%\" height=\"100%\" allowtransparency=\"true\" src=\"',%3,'\" frameborder=\"0\" allow-same-origin allow=\"autoplay\" allowfullscreen][/iframe]',get(iPad_hs2));\n\t\t\t\t\tcopy(layer[%1].html, iframecode);\n\t\t\t\t\tset(layer[%1].padding, 0);\n\t\t\t\t\tset(layer[%1].url, 'textfield.swf');\n\t\t\t\t\tset(layer[%1].interactivecontent, true);\n\t\t\t\t\tset(layer[%1].onloaded, iframe_resize(%1); );\n\t\t\t\t\t,\n\t\t\t\t\tshowlog();\n\t\t\t\t\ttrace(error,'Iframe is not working in flash mode!');\n\t\t\t);\n\t\t);\n\t");
		
		if (typeof g360 != 'undefined' && g360.isPopupVROpen == "F"){
			g360.offsound_bg();
		}
		
		__pano1.krpano1.get('WebVR').vr_cursor_enabled = false;
		
		this.viewCountUp();
		
		// 아래 항목들은  Scene이 변경되도 한번만 수행됨
		if (!this.onloadComplete) {
			// 가이드를 표시한다.
			this.showGuide();			
			this.onloadComplete = true;
		}
		
	},
	
	"showGuide" : function(){
		$('#vr_guide_layer').show();
		$('#vr_guide_layer').on('click', function(){
			$('#vr_guide_layer').hide();
			// 전체화면으로 띄우는 경우 사용자의 action없이는 음악재생이 안되므로, 클릭 이벤트에 bgmusic이벤트를 걸어줌
			if (bgmusic != ""){
				__pano1.krpano1.call("playsound(bgsnd, '"+bgmusic+"', 0);");
			}
		});
	}
	
}

var __pano1 = new pano1();

$(document).ready(function(){
	
	__pano1.init();
});
