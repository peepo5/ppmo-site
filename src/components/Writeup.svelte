<script>
    import Markdown from "./Markdown.svelte";

    export let title = "Untitled";
    export let subtitle = "";
    export let image = "";
    export let md;
    export let notitles = false;

    mixpanel.init('c5cad05270531f641b33c1e4809d7485', {debug: true, ignore_dnt: true});
    mixpanel.identify(ls_id);
    mixpanel.track(`Writeup`);
    mixpanel.track(`Writeup: ${title}`);
</script>

<main>
    <title>Writeup - {title}</title>
    {#if image != ""}
        <img src="../images/{image}" style="max-width: 400px;" alt="banner">
    {/if}
    {#if !notitles}
        <h1>{title}</h1>
        {#if subtitle != ""}
            <h2>{subtitle}</h2>
        {/if}
    {/if}
    <div class="cent-container">
        <div class="writeup">
        <Markdown markdown={md}/>
        </div>
    </div>
</main>