<main>
	<title>Purge PMO</title>
	
	<img src="images/ppmo_circle_web.png" class="circle-light-up" height=200px alt="logo banner">
	<h1 class="light-up-underline" title="ppmo stands for purge pmo.">ppmo</h1>
	<p style="margin-top: 3px;">Freedom comes from understanding.<br> A book to become free from the porn and masturbation trap.</p>

	<a href="/chapter/0"><button class="button">Read the book</button></a><br><br>
	<a on:click={() => send_to_mix("Physical Book")} href="https://www.lulu.com/shop/cat-guy/ppmo-paperback/paperback/product-gmz9p6.html" target="_blank" title="Print on demand. No profit made on this. Use code THANKYOU20.">Physical Copy</a> |
	<a on:click={() => send_to_mix("Donate")} href="https://opencollective.com/ppmo-collective-fund" target="_blank" title="Donate to help out the project">Donate</a>
</main>

<script>
	// Mixpanel import
	(function(f,b){if(!b.__SV){var e,g,i,h;window.mixpanel=b;b._i=[];b.init=function(e,f,c){function g(a,d){var b=d.split(".");2==b.length&&(a=a[b[0]],d=b[1]);a[d]=function(){a.push([d].concat(Array.prototype.slice.call(arguments,0)))}}var a=b;"undefined"!==typeof c?a=b[c]=[]:c="mixpanel";a.people=a.people||[];a.toString=function(a){var d="mixpanel";"mixpanel"!==c&&(d+="."+c);a||(d+=" (stub)");return d};a.people.toString=function(){return a.toString(1)+".people (stub)"};i="disable time_event track track_pageview track_links track_forms track_with_groups add_group set_group remove_group register register_once alias unregister identify name_tag set_config reset opt_in_tracking opt_out_tracking has_opted_in_tracking has_opted_out_tracking clear_opt_in_out_tracking start_batch_senders people.set people.set_once people.unset people.increment people.append people.union people.track_charge people.clear_charges people.delete_user people.remove".split(" ");
	for(h=0;h<i.length;h++)g(a,i[h]);var j="set set_once union unset remove delete".split(" ");a.get_group=function(){function b(c){d[c]=function(){call2_args=arguments;call2=[c].concat(Array.prototype.slice.call(call2_args,0));a.push([e,call2])}}for(var d={},e=["get_group"].concat(Array.prototype.slice.call(arguments,0)),c=0;c<j.length;c++)b(j[c]);return d};b._i.push([e,f,c])};b.__SV=1.2;e=f.createElement("script");e.type="text/javascript";e.async=!0;e.src="undefined"!==typeof MIXPANEL_CUSTOM_LIB_URL?
	MIXPANEL_CUSTOM_LIB_URL:"file:"===f.location.protocol&&"//cdn.mxpnl.com/libs/mixpanel-2-latest.min.js".match(/^\/\//)?"https://cdn.mxpnl.com/libs/mixpanel-2-latest.min.js":"//cdn.mxpnl.com/libs/mixpanel-2-latest.min.js";g=f.getElementsByTagName("script")[0];g.parentNode.insertBefore(e,g)}})(document,window.mixpanel||[]);
	// End of import
	import { Link } from "svelte-navigator";

	let ls_id = localStorage.getItem("usr_id");
		if(ls_id == undefined) {
			let date = Date.now()
			localStorage.setItem("usr_id", date);
			ls_id = date;
		}
		
	mixpanel.alias(ls_id);
	mixpanel.identify(ls_id);

	mixpanel.init('a7532ed6827d50d6d62d6eb298ccc9c5', {debug: true, ignore_dnt: true}); 

	function send_to_mix(text) {
		mixpanel.track(text);
	}
</script>
