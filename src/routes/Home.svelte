<main>
	<title>Purge PMO</title>
	
	<img src="images/ppmo_circle_no_more.png" class="circle-light-up" title="{ti["pmo-name-info"][lshort]}" height=200px alt="logo banner">
	<h1 class="light-up-underline" title="{ti["pmo-name-info"][lshort]}">ppmo</h1>
	<p style="margin-top: 3px;">
		<!--
		{ti["description-p1"][lshort]}<br>
		{ti["description-p2"][lshort]}<br>
		We are part of the <a href="">neuroregen collective</a>.
		-->
		ppmo no longer exists.
		<br><br>
		After much revision, I took steps back to create something entirely new.
		<br><br>
		This project lies under the name: Burgeon.
		<br><br>
		<a href="https://burgeonbook.org"><button class="button">Visit The Book</button></a>
	</p>
	<!--
	{#each ["us", "fr", "ru"] as lang}
	<img class="mini-flag" src="images/flags/{lang}.svg" alt="{lang}" title="{ti["lang-disclaim"][lshort]}">
	{/each}<br>-->
	<!--<p><b>New <u><a href="/writeups">Writeups</a></u> section!</b></p>--><br>
	<!--
	<a on:click={() => send_to_mix("Physical Book")} href="https://www.lulu.com/shop/cat-guy/ppmo-paperback/paperback/product-gmz9p6.html" target="_blank" rel="noreferrer" title="{ti["physical-info"][lshort]}">{ti["physical-copy"][lshort]}</a> |
	<a on:click={() => send_to_mix("Audiobook")} href="https://odysee.com/ppmo_audiobook_v3:e" rel="noreferrer" title="{ti["audiobook-info"][lshort]}">{ti["audiobook"][lshort]}</a> | 
	<a on:click={() => send_to_mix("Donate")} href="https://opencollective.com/ppmo-collective-fund" target="_blank" rel="noreferrer" title="{ti["donate-info"][lshort]}">{ti["donate"][lshort]}</a> | 
	<a on:click={() => send_to_mix("Writeups")} href="writeups">Writeups [New]</a>
	-->

	<!--<br><br>-->
	<!--<a href="/chapter/0"><button class="button">{ti["read-the-book"][lshort]}</button></a><br><br>-->
	
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

	mixpanel.init('c5cad05270531f641b33c1e4809d7485', {debug: true, ignore_dnt: true});
	mixpanel.identify(ls_id);

	function send_to_mix(text) {
		mixpanel.track(text);
	}

</script>
