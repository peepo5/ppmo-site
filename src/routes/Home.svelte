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
