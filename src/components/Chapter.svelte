<script>
    // Mixpanel import
	(function(f,b){if(!b.__SV){var e,g,i,h;window.mixpanel=b;b._i=[];b.init=function(e,f,c){function g(a,d){var b=d.split(".");2==b.length&&(a=a[b[0]],d=b[1]);a[d]=function(){a.push([d].concat(Array.prototype.slice.call(arguments,0)))}}var a=b;"undefined"!==typeof c?a=b[c]=[]:c="mixpanel";a.people=a.people||[];a.toString=function(a){var d="mixpanel";"mixpanel"!==c&&(d+="."+c);a||(d+=" (stub)");return d};a.people.toString=function(){return a.toString(1)+".people (stub)"};i="disable time_event track track_pageview track_links track_forms track_with_groups add_group set_group remove_group register register_once alias unregister identify name_tag set_config reset opt_in_tracking opt_out_tracking has_opted_in_tracking has_opted_out_tracking clear_opt_in_out_tracking start_batch_senders people.set people.set_once people.unset people.increment people.append people.union people.track_charge people.clear_charges people.delete_user people.remove".split(" ");
	for(h=0;h<i.length;h++)g(a,i[h]);var j="set set_once union unset remove delete".split(" ");a.get_group=function(){function b(c){d[c]=function(){call2_args=arguments;call2=[c].concat(Array.prototype.slice.call(call2_args,0));a.push([e,call2])}}for(var d={},e=["get_group"].concat(Array.prototype.slice.call(arguments,0)),c=0;c<j.length;c++)b(j[c]);return d};b._i.push([e,f,c])};b.__SV=1.2;e=f.createElement("script");e.type="text/javascript";e.async=!0;e.src="undefined"!==typeof MIXPANEL_CUSTOM_LIB_URL?
	MIXPANEL_CUSTOM_LIB_URL:"file:"===f.location.protocol&&"//cdn.mxpnl.com/libs/mixpanel-2-latest.min.js".match(/^\/\//)?"https://cdn.mxpnl.com/libs/mixpanel-2-latest.min.js":"//cdn.mxpnl.com/libs/mixpanel-2-latest.min.js";g=f.getElementsByTagName("script")[0];g.parentNode.insertBefore(e,g)}})(document,window.mixpanel||[]);
	// End of import
    import { Link } from "svelte-navigator";
    import Typewriter from "svelte-typewriter";
    import Markdown from "./Markdown.svelte";

    export let chapter = 0;
    export let title = "";
    export let subtitle = "";
    export let md = "";

    export let chapters = [];
    export let themes = [];
    export let fonts = [];
    export let aligns = [];

    let completion_disabled = true;
    let mark_done_disabled = false;

    let completed = false;
    let boogoodled = false;
    let completed_all = false;
    let mobile_menu_open = false;
    let temp_completed;

    let popup_type = "settings";

    let selected_theme;
    let selected_font;
    let selected_align;

    let next_chapter = {};

    if(chapter != chapters.length-1) {
    	next_chapter = chapters[chapter+1];
    }

    let completed_chapters = JSON.parse(localStorage.getItem("completed_chapters"));

    const complete_chapter = () => {
    	completion_disabled = false;
    	mark_done_disabled = true;

        for(let i = 0; i <= chapter; i++){
            completed_chapters[i] = true;
        }
    	localStorage.setItem("completed_chapters", JSON.stringify(completed_chapters));

    	completed = true;
    	completed_all = completed_chapters.every(element => element);
    };

    const generate_completed_chapters = () => {
    	completed_chapters = [];
    	for (let i = 0; i < chapters.length; i++) {
    		completed_chapters[i] = false;
    	}
    };

    const reset_completed = () => {
    	localStorage.removeItem("completed_chapters");
    	window.location.replace("/chapter/0");
    };

    const toggle_popup = () => {
        let settings = document.getElementsByClassName("settings-container")[0];
        let overlay = document.getElementsByClassName("overlay")[0];
        if(settings.style.display == "") {
            settings.style.display = "flex";
            overlay.style.display = "block";
        } else {
            settings.style.display = "";
            overlay.style.display = "";
        }
        
    }

    const update_theme = () => {
        localStorage.setItem("theme", selected_theme.real);
        for(let i = 0; i < themes.length; i++) {
            document.documentElement.classList.remove(themes[i].real+"-theme");
        }
        document.documentElement.classList.add(selected_theme.real+"-theme");  
    }

    const update_font = () => {
        localStorage.setItem("font", selected_font.real);
        for(let i = 0; i < fonts.length; i++) {
            document.documentElement.classList.remove(fonts[i].real+"-font");
        }
        document.documentElement.classList.add(selected_font.real+"-font");  
    }

    const update_align = () => {
        localStorage.setItem("align", selected_align.real);
        for(let i = 0; i < aligns.length; i++) {
            document.documentElement.classList.remove(aligns[i].real+"-align");
        }
        document.documentElement.classList.add(selected_align.real+"-align");  
    }

    const toggle_mobile_menu = () => {
        let side_nav = document.getElementsByClassName("side-nav")[0];
        let chap_header = document.getElementsByClassName("chapter-header")[0];
        if(!mobile_menu_open) {
            side_nav.style.display = "block";
            chap_header.style.marginLeft = "50px";
        } else {
            side_nav.style.display = "none";
            chap_header.style.marginLeft = "0px";
        }
        mobile_menu_open = !mobile_menu_open;
        console.log(mobile_menu_open)
    }

    const toggle_settings = () => {
        popup_type = "settings";
        toggle_popup();
    }

    const toggle_languages = () => {
        popup_type = "languages";
        toggle_popup();
    }

    const toggle_downloads = () => {
        popup_type = "downloads";
        toggle_popup();
    }

    if (completed_chapters == undefined) {
    	generate_completed_chapters();
    }

    if (chapter != 0 && completed_chapters[chapter-1] == false) { 
    	mark_done_disabled = true;
    	boogoodled = true;
    }

    if (completed_chapters[chapter] == true && !boogoodled) {
    	complete_chapter();
    }

    // Update theme selection
    let ls_theme = localStorage.getItem("theme");
    if(ls_theme != undefined) {
        for(let i = 0; i < themes.length; i++) {
            if(themes[i].real == ls_theme) {
                selected_theme = themes[i];
                break;
            }
        }
    }

    // Update font selection
    let ls_font = localStorage.getItem("font");
    if(ls_font != undefined) {
        for(let i = 0; i < fonts.length; i++) {
            if(fonts[i].real == ls_font) {
                selected_font = fonts[i];
                break;
            }
        }
    }

    // Update alignment
    let ls_align = localStorage.getItem("align");
    if(ls_align != undefined) {
        for(let i = 0; i < aligns.length; i++) {
            if(aligns[i].real == ls_align) {
                selected_align = aligns[i];
                break;
            }
        }
    }

    // Analytics

    let ls_id = localStorage.getItem("usr_id");
		if(ls_id == undefined) {
			let date = Date.now()
			localStorage.setItem("usr_id", date);
			ls_id = date;
		}
		
	mixpanel.alias(ls_id);
	mixpanel.identify(ls_id);

	mixpanel.init('a7532ed6827d50d6d62d6eb298ccc9c5', {debug: true, ignore_dnt: true}); 
    mixpanel.track(`Chapter ${chapter}`);

	function send_to_mix(text) {
		mixpanel.track(text);
	}

</script>

<main>
    <header>
        <title>Chapter {chapter} - {title} (ppmo)</title>
    </header>

    {#if !mobile_menu_open}
    <div class="menu-container" on:click={() => toggle_mobile_menu()}>
        <div class="linkify menu-inner">Menu</div>
    </div>
    {/if}


    <div class="middlefy">
        <div class="overlay" on:click={() => toggle_popup()}></div>

        <div class="settings-container">
            <div class="settings">
                <div on:click={() => toggle_popup()}>
                    <img src="../images/close-outline.svg" class="close-settings linkify invert-color" alt="close" title="Close (duh?)">
                </div>
                {#if popup_type == "settings"}

                <h1>Settings</h1>
                <label for="select">Theme</label>
                <select class="select" bind:value={selected_theme} on:change={() => update_theme()}>
                    {#each themes as t}
                    <option value={t}>
                        {t.title}
                    </option>
                    {/each}
                </select>
                <br><br>
                <label for="select">Font</label>
                <select class="select fontify-pls" bind:value={selected_font} on:change={() => update_font()}>
                    {#each fonts as f}
                    <option value={f}>
                        {f.title}
                    </option>
                    {/each}
                </select>
                <br><br>
                <label for="select">Aligment</label>
                <select class="select" bind:value={selected_align} on:change={() => update_align()}>
                    {#each aligns as a}
                    <option value={a}>
                        {a.title}
                    </option>
                    {/each}
                </select>

                <br><br>
                <a href="https://github.com/free-synd/ppmo-site" target="_blank">
                    <img src="../images/github-logo.svg" alt="github" class="invert-color" title="Visit project GitHub (source code)" height=30px>
                </a>

                {:else if popup_type == "languages"}
                <h1>Languages</h1>
                <p>English-only for now.</p>
                <p>Translations will come at a later date.</p>
                {:else}
                <h1>Downloads</h1>
                <span>
                    <a href="https://github.com/free-synd/ppmo-site/raw/master/public/offline/_COMPLETE/pdf/en-3.0-main.md.pdf" target="_blank" title="Standard Light Background PDF (Portable Document Format) file"><button class="button">PDF</button></a>
                    <a href="https://github.com/free-synd/ppmo-site/raw/master/public/offline/_COMPLETE/epub/en-3.0-main.md.epub" target="_blank" title="Standard EPUB (Electronic Publication) file. EPUB is good for mobile devices."><button class="button">EPUB</button></a>
                    <a href="https://github.com/free-synd/ppmo-site/raw/master/public/offline/_COMPLETE/epub/en-3.0-main.md-dark.epub" target="_blank" title="Dark Background EPUB (Electronic Publication) file. EPUB is good for mobile devices."><button class="button">EPUB (Dark)</button></a>
                    <a href="https://raw.githubusercontent.com/free-synd/ppmo-site/master/public/offline/_COMPLETE/md/en-3.0-main.md" download target="_blank" title="Merged markdown. Right click when you visit page to download."><button class="button">MD</button></a>
                    <a href="https://raw.githubusercontent.com/free-synd/ppmo-site/master/public/offline/_COMPLETE/zip/en-3.0-main-markdown.zip" download target="_blank" title="Zipped markdown files."><button class="button">ZIP</button></a>
                    <br>
                    <p>
                        PDF is better for physical copies. EPUB is best for mobile devices, and ZIP/MD is best for copying text from the book.
                    </p>
                </span>
                {/if}
            </div>
        </div>
    </div>

    <div class="side-nav">
        {#if mobile_menu_open}
        <img src="../images/close-outline.svg" class="side-icon linkify link" style="width: 30px; padding-left: 11px;" title="Close menu" alt="close" on:click={() => toggle_mobile_menu()}>
        {/if}
        <img src="../images/download-outline.svg" class="side-icon linkify link" style="width: 30px; padding-left: 11px;" title="Download the book (download options)" alt="downloads" on:click={() => toggle_downloads()}>
        <Link to="/" title="Visit Home"><img src="../images/home-outline.svg" class="side-icon linkify link" style="width: 26px; padding-left: 13px;" alt="home"></Link>
        {#each chapters as chap, i}
            {#if completed_chapters[i] == true}
            <span class="dot" style="background-color: #38e421"></span>
            {/if}
            {#if i == chapter}
                <Link to="/chapter/{i}" class="link active-link" title="Visit Chapter {i} - {chap.title}" on:click={() => window.scrollTo(0, 0)}>{i}</Link>
            {:else}
                <Link to="/chapter/{i}" class="link" title="Visit Chapter {i} - {chap.title}" on:click={() => window.scrollTo(0, 0)}>{i}</Link>
            {/if}
        {/each}
        <img src="../images/language-outline.svg" class="side-icon linkify link" style="width: 30px; padding-left: 11px;" title="Open languages" alt="languages" on:click={() => toggle_languages()}>
        <img src="../images/settings-outline.svg" class="side-icon linkify link" style="width: 30px; padding-left: 11px;" title="Open settings" alt="settings" on:click={() => toggle_settings()}>
        <div style="margin-bottom: 30px;"></div>
    </div>
    <br>
    <div class="chapter-header">
        <h3 class="light-up-underline" style="margin-bottom:0px;">Chapter {chapter}</h3>
        <h1 class="light-up-underline" style="margin-top:2px;">{title}</h1>
        {#if subtitle != ""}
            <Typewriter interval={60} cursor={false}><h4 class="no-margin" style="font-size: 20px;padding:5px;"><i>{subtitle}</i></h4></Typewriter>
        {/if}

        {#if chapter == 0}
        <audio controls style="margin-top:12px" title="Some fitting audio. From Lil Darkie - Dreaming.">
            <source src="../intro.mp3" type="audio/mpeg">
        </audio> 
        {/if}

        <div class="cent-container">
            <div class="chapter">
                <Markdown markdown={md}/>
            </div>
        </div>
        {#if chapter == chapters.length-1}
        <br>
        <a on:click={() => send_to_mix("Donate")} href="https://opencollective.com/ppmo-collective-fund" target="_blank">
            <button class="button" title="Donate to help the ppmo project" style="background-color:#314879">Donate via opencollective</button>
        </a>
        <br><br>

        {/if}
        {#if !completed_all}
        <button class="button mark_done_button" on:click={() => complete_chapter()} title="Mark the current chapter complete">
            {#if !completed}
            Mark Done
            {:else}
            Completed
            {/if}
        </button>
        {:else}
        <button class="button" style="background-color: black; border:none;" on:click={() => reset_completed()} title="Resets all completed chapters">
            Reset All
        </button>
        {#if chapter == chapters.length-1}
        <a href="/hs_6d61796265003733203639203664203666">
            <button class="button" title="...">Hidden Section</button>
        </a>
        {/if}

        {/if}
        {#if chapter != chapters.length-1}
            <a href="/chapter/{chapter+1}" class="link" on:click={() => window.scrollTo(0, 0)} title="Visit Chapter {chapter+1} - {next_chapter.title}">
                <button class="button completion-button" disabled={completion_disabled}>Next Chapter</button>
            </a>
        {/if}
        <br><br><br><br><br>
    </div>
</main>