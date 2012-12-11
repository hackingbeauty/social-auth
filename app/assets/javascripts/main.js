$(document).ready(function() {
	SlimScale = {
		init:function(){
			var self = this;
			self.trackWeightButton();
		},
		trackWeightButton: function(){
			var self = this;
			$('#track-weight').click(function(){
				$('#loader').show();
				var pinger = setInterval(function(){
					$.ajax({
						url:'/lookup',
						dataType: 'json',
						data: {
							"email": $('#track-weight').data('facebook-id')
						},
						type: 'get',
						success:function (res) {
							if(res['weight'] !== null){
								clearInterval(pinger);
								self.showDigitalScale(res['weight']);
							}
						},
						error: function(res){
							console.log('boohooo! ajax error');
						}
					});
				},1000)
			});
		},
		showDigitalScale: function(weight){
			$('#loader').hide();
			$('#digital-scale').show().html(weight);
		}
	}

	SlimScale.init();
});

