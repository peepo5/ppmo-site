<script>
	import { Router, Route } from "svelte-navigator";
	import Home from "./Home.svelte";
	import x from  "../components/trash/x.svelte";
	import Chapter from "../components/Chapter.svelte";

	// Chapters
	import C0 from "../markdown/0. Prefix.md";
	import C1 from "../markdown/1. Introduction.md";
	import C2 from "../markdown/2. Benefits.md";
	import C3 from "../markdown/3. Ownership.md";
	import C4 from "../markdown/4. Desire.md";
	import C5 from "../markdown/5. Nature.md";
	import C6 from "../markdown/6. Neurology.md";
	import C7 from "../markdown/7. Brainwashing.md";
	import C8 from "../markdown/8. Neuroplasticity.md";
	import C9 from "../markdown/9. Transmutation.md";
	import C10 from "../markdown/10. Freedom.md";

	let chapters = [
		{
			name: "Prefix",
			title: "New Beginnings",
			subtitle: "About the book.",
			md: C0
		},
		{
			name: "Introduction",
			title: "Introduction",
			subtitle: "Welcome to the book.",
			md: C1
		},
		{
			name: "Benefits",
			title: "Benefits",
			subtitle: "Benefits or removal of negatives?",
			md: C2
		},
		{
			name: "Ownership",
			title: "Ownership",
			subtitle: "You must own your problems.",
			md: C3
		},
		{
			name: "Desire",
			title: "Desire",
			subtitle: "The thing which achieves dreams.",
			md: C4
		},
		{
			name: "Nature",
			title: "Human Nature",
			subtitle: "Our inherent way of functioning.",
			md: C5
		},
		{
			name: "Neurology",
			title: "Neurology",
			subtitle: "How the chemicals in our brains work.",
			md: C6
		},
		{
			name: "Brainwashing",
			title: "Brainwashing",
			subtitle: "Diving into the untruths.",
			md: C7
		},
		{
			name: "Neuroplasticity",
			title: "Neuroplasticity",
			subtitle: "Processes and reactions.",
			md: C8
		},
		{
			name: "Transmutation",
			title: "Transmutation",
			subtitle: "Closing notes.",
			md: C9
		},
		{
			name: "Freedom",
			title: "Freedom",
			subtitle: "Forever onwards",
			md: C10
		},
	];

	// If this changes, book progress is removed
	const major_vers = "1-main";
	const exist_vers = localStorage.getItem("ppmo_version");

	if (exist_vers != undefined) {
		if (exist_vers != major_vers) {
			localStorage.removeItem("completed_chapters");
		}
	}

	localStorage.setItem("ppmo_version", major_vers);

	// Theme detection and change
	let themes = [
        {
            title: "Dark Theme (Cool)",
            real: "cool-dark"
        },
		{
            title: "Dark Theme (Warm)",
            real: "warm-dark"
        },
        {
            title: "Light Theme",
            real: "light"
        },
		{
            title: "Light Theme (Grid)",
            real: "light-grid"
        },
		{
            title: "Retro Theme",
            real: "retro-dark"
        },
		{
            title: "Black Theme (OLED)",
            real: "black"
        },
    ];

	let font = localStorage.getItem("font");
	if (font != undefined) {
		document.documentElement.classList.add(font+"-font");
	} else {
		for(let i = 0; i < themes.length; i++) {
			document.documentElement.classList.remove(font+"-font");
		}
	}

	// Font detection and change
	let fonts = [
        {
            title: "Monnaco",
            real: "monnaco"
        },
		{
            title: "Open Sans",
            real: "open-sans"
        },
		{
            title: "Open Dyslexic",
            real: "open-dyslexic"
        },
    ];

	let theme = localStorage.getItem("theme");
	if (theme != undefined) {
		document.documentElement.classList.add(theme+"-theme");
	} else {
		for(let i = 0; i < themes.length; i++) {
			document.documentElement.classList.remove(theme+"-theme");
		}
	}
</script>

<Router primary={false}>
	<main>

	{#each chapters as chapter, i}
		<Route path="chapter/{i.toString()}">
			<Chapter
				chapter={i}
				title={chapter.title}
				subtitle={chapter.subtitle}
				md={chapter.md}
				themes={themes}
				chapters={chapters}
				fonts={fonts}
			/>
		</Route>
	{/each}

	<Route path="/">
		<Home />
	</Route>

	<Route path="hs_6d61796265003733203639203664203666">
		<title>404</title>
		<h3><span on:click={() => window.location.href = "hs_6d617962650003733203639203664203666"}>404</span></h3>
		<p>No Route could be matched. <a href="/">Home</a></p>
	</Route>
	<Route path="hs_6d617962650003733203639203664203666" component={x}/>

	<Route path="*">
		<title>404</title>
		<h3>404</h3>
		<p>No Route could be matched. <a href="/">Home</a></p>
	</Route>

	</main>
</Router>