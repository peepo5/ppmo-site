<script>
import { forEach } from "markdown-it/lib/common/html_blocks";

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

    let completion_disabled = true;
    let mark_done_disabled = false;

    let completed = false;
    let boogoodled = false;
    let completed_all = false;

    let popup_type = "settings";

    let selected_theme;
    let selected_font;

    let next_chapter = {};

    if(chapter != chapters.length-1) {
    	next_chapter = chapters[chapter+1];
    }

    let completed_chapters = JSON.parse(localStorage.getItem("completed_chapters"));

    const complete_chapter = () => {
    	completion_disabled = false;
    	mark_done_disabled = true;

    	completed_chapters[chapter] = true;
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

    const toggle_settings = () => {
        popup_type = "settings";
        toggle_popup();
    }

    const toggle_languages = () => {
        popup_type = "languages";
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

</script>

<main>
    <header>
        <title>Chapter {chapter} - {title} (ppmo)</title>
    </header>

    <div class="middlefy">
        <div class="overlay" on:click={() => toggle_popup()}></div>

        <div class="settings-container">
            <div class="settings">
                <div on:click={() => toggle_popup()}>
                    <img src="../images/close-outline.svg" class="close-settings linkify invert-color" alt="close">
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
                    {#each fonts as t}
                    <option value={t}>
                        {t.title}
                    </option>
                    {/each}
                </select>

                <br><br>
                <a href="https://github.com/free-synd/ppmo-site" target="_blank">
                    <img src="../images/github-logo.svg" alt="github" class="invert-color" height=30px>
                </a>

                {:else}
                <h1>Languages</h1>
                <p>English-only for now.</p>
                <p>Translations will come at a later date.</p>
                {/if}
            </div>
        </div>
    </div>

    <div class="side-nav">
        <Link to="/" class="link" title="Visit Home">H</Link>
        {#each chapters as chap, i}
            {#if i == chapter}
            <Link to="/chapter/{i}" class="link active-link" title="Visit Chapter {i} - {chap.title}">{i}</Link>
            {:else}
            <Link to="/chapter/{i}" class="link" title="Visit Chapter {i} - {chap.title}">{i}</Link>
            {/if}
        {/each}
        <img src="../images/language-outline.svg" class="side-icon linkify link" style="width: 30px; padding-left: 11px;" title="Open languages" alt="languages" on:click={() => toggle_languages()}>
        <img src="../images/settings-outline.svg" class="side-icon linkify link" style="width: 30px; padding-left: 11px;margin-bottom: 30px;" title="Open settings" alt="settings" on:click={() => toggle_settings()}>
    </div>
    <br>
    <div class="chapter-header">
        <h3 class="light-up-underline" style="margin-bottom:0px;">Chapter {chapter}</h3>
        <h1 class="light-up-underline" style="margin-top:2px;">{title}</h1>
        {#if subtitle != ""}
            <Typewriter interval={60} cursor={false}><h4 class="no-margin" style="font-size: 20px;padding:5px;"><i>{subtitle}</i></h4></Typewriter>
        {/if}

        <div class="cent-container">
            <div class="chapter">
                <Markdown markdown={md}/>
            </div>
        </div>
        {#if !completed_all}
        <button class="button mark_done_button" disabled={mark_done_disabled} on:click={() => complete_chapter()} title="Mark the current chapter complete">
            {#if boogoodled == true}
            Mark Last Chapter Done
            {:else}
                {#if !completed}
                Mark Done
                {:else}
                Completed
                {/if}
            {/if}
        </button>
        {:else}
        <button class="button" style="background-color: black; border:none;" on:click={() => reset_completed()} title="Resets all completed chapters">
            Reset All
        </button>
        {#if chapter == chapters.length-1}
        <Link to="/hs_6d61796265003733203639203664203666">
            <button class="button" title="...">Hidden Section</button>
        </Link>
        {/if}

        {/if}
        {#if chapter != chapters.length-1}
            <Link to="/chapter/{chapter+1}" class="link" on:click={() => window.scrollTo(0, 0)} title="Visit Chapter {chapter+1} - {next_chapter.title}">
                <button class="button completion-button" disabled={completion_disabled}>Next Chapter</button>
            </Link>
        {/if}
        <br><br><br><br><br>
    </div>
</main>