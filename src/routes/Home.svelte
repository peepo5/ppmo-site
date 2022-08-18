<main>
	<title>Purge PMO</title>
	
	<img src="images/ppmo_circle_web.png" class="circle-light-up" title="{ti["pmo-name-info"][lshort]}" height=200px alt="logo banner">
	<h1 class="light-up-underline" title="{ti["pmo-name-info"][lshort]}">ppmo</h1>
	<p style="margin-top: 3px;">{ti["description-p1"][lshort]}<br> {ti["description-p2"][lshort]}</p>
	{#each ["us", "fr"] as lang}
	<img class="mini-flag" src="images/flags/{lang}.svg" alt="{lang}" title="{ti["lang-disclaim"][lshort]}">
	{/each}<br>
	<p><b>Now in French!</b></p>
	<a on:click={() => send_to_mix("Physical Book")} href="https://www.lulu.com/shop/cat-guy/ppmo-paperback/paperback/product-gmz9p6.html" target="_blank" title="{ti["physical-info"][lshort]}">{ti["physical-copy"][lshort]}</a> |
	<a on:click={() => send_to_mix("Audiobook")} href="https://odysee.com/ppmo_audiobook_v3:e" title="{ti["audiobook-info"][lshort]}">{ti["audiobook"][lshort]}</a> | 
	<a on:click={() => send_to_mix("Donate")} href="https://opencollective.com/ppmo-collective-fund" target="_blank" title="{ti["donate-info"][lshort]}">{ti["donate"][lshort]}</a>
	<br><br>
	<a href="/chapter/0"><button class="button">{ti["read-the-book"][lshort]}</button></a><br><br>
	
</main>

<script>
	export let translation_index = {};
	let ti = translation_index;
	export let language_info = {};
	let lshort = language_info.short_name;

	let ls_id = localStorage.getItem("usr_id");
		if(ls_id == undefined) {
			let date = Date.now()
			localStorage.setItem("usr_id", date);
			ls_id = date;
		}

	mixpanel.init('a7532ed6827d50d6d62d6eb298ccc9c5', {debug: true, ignore_dnt: true});
	mixpanel.identify(ls_id);

	function send_to_mix(text) {
		mixpanel.track(text);
	}

</script>
