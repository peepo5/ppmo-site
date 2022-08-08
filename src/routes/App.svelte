<script>
	// Mixpanel import
	(function(f,b){if(!b.__SV){var e,g,i,h;window.mixpanel=b;b._i=[];b.init=function(e,f,c){function g(a,d){var b=d.split(".");2==b.length&&(a=a[b[0]],d=b[1]);a[d]=function(){a.push([d].concat(Array.prototype.slice.call(arguments,0)))}}var a=b;"undefined"!==typeof c?a=b[c]=[]:c="mixpanel";a.people=a.people||[];a.toString=function(a){var d="mixpanel";"mixpanel"!==c&&(d+="."+c);a||(d+=" (stub)");return d};a.people.toString=function(){return a.toString(1)+".people (stub)"};i="disable time_event track track_pageview track_links track_forms track_with_groups add_group set_group remove_group register register_once alias unregister identify name_tag set_config reset opt_in_tracking opt_out_tracking has_opted_in_tracking has_opted_out_tracking clear_opt_in_out_tracking start_batch_senders people.set people.set_once people.unset people.increment people.append people.union people.track_charge people.clear_charges people.delete_user people.remove".split(" ");
	for(h=0;h<i.length;h++)g(a,i[h]);var j="set set_once union unset remove delete".split(" ");a.get_group=function(){function b(c){d[c]=function(){call2_args=arguments;call2=[c].concat(Array.prototype.slice.call(call2_args,0));a.push([e,call2])}}for(var d={},e=["get_group"].concat(Array.prototype.slice.call(arguments,0)),c=0;c<j.length;c++)b(j[c]);return d};b._i.push([e,f,c])};b.__SV=1.2;e=f.createElement("script");e.type="text/javascript";e.async=!0;e.src="undefined"!==typeof MIXPANEL_CUSTOM_LIB_URL?
	MIXPANEL_CUSTOM_LIB_URL:"file:"===f.location.protocol&&"//cdn.mxpnl.com/libs/mixpanel-2-latest.min.js".match(/^\/\//)?"https://cdn.mxpnl.com/libs/mixpanel-2-latest.min.js":"//cdn.mxpnl.com/libs/mixpanel-2-latest.min.js";g=f.getElementsByTagName("script")[0];g.parentNode.insertBefore(e,g)}})(document,window.mixpanel||[]);
	// End of import
	import { Router, Route } from "svelte-navigator";
	import Home from "./Home.svelte";
	import x from  "../components/trash/x.svelte";
	import Chapter from "../components/Chapter.svelte";

	// Chapters
	import C0 from "../markdown/english/0. Prefix.md";
	import C1 from "../markdown/english/1. Introduction.md";
	import C2 from "../markdown/english/2. Benefits.md";
	import C3 from "../markdown/english/3. Ownership.md";
	import C4 from "../markdown/english/4. Desire.md";
	import C5 from "../markdown/english/5. Nature.md";
	import C6 from "../markdown/english/6. Neurology.md";
	import C7 from "../markdown/english/7. Brainwashing.md";
	import C8 from "../markdown/english/8. Neuroplasticity.md";
	import C9 from "../markdown/english/9. Transmutation.md";
	import C10 from "../markdown/english/10. Moving On.md";
	import C11 from "../markdown/english/11. Freedom.md";

	// If this changes, book progress is removed
	const major_vers = "3.0-main";
	const formatted_vers = "ppmo version 3.0"
	const exist_vers = localStorage.getItem("ppmo_version");

	if (exist_vers != undefined) {
		if (exist_vers != major_vers) {
			localStorage.removeItem("completed_chapters");
		}
	}

	localStorage.setItem("ppmo_version", major_vers);

	let chapters = [
		{
			name: "Prefix",
			title: "New Beginnings",
			
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
			subtitle: "Going over the untruths.",
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
			name: "Move On",
			title: "Moving On",
			subtitle: "You have to put yourself first.",
			md: C10
		},
		{
			name: "Freedom",
			title: "Freedom",
			subtitle: "Forever onwards",
			md: C11
		},
	];

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
            title: "Open Sans",
            real: "open-sans"
        },
        {
            title: "Monnaco",
            real: "monnaco"
        },
		{
			title: "PT Sans",
			real: "pt-sans"
		},
		{
			title: "PT Serif",
			real: "pt-serif"
		},
		{
			title: "Georgia",
			real: "georgia"
		},
		{
            title: "Open Dyslexic",
            real: "open-dyslexic"
        },
    ];

	let aligns = [
        {
            title: "Left",
			real: "left"
        },
		{
            title: "Middle",
			real: "middle"
        },
		{
            title: "Right",
			real: "right"
        }
    ]

	let theme = localStorage.getItem("theme");
	if (theme != undefined) {
		document.documentElement.classList.add(theme+"-theme");
	} else {
		for(let i = 0; i < themes.length; i++) {
			document.documentElement.classList.remove(theme+"-theme");
		}
	}

	let align = localStorage.getItem("align");
	if (align != undefined) {
		document.documentElement.classList.add(align+"-align");
	} else {
		for(let i = 0; i < aligns.length; i++) {
			document.documentElement.classList.remove(align+"-align");
		}
	}

	// Analytics
	mixpanel.init('a7532ed6827d50d6d62d6eb298ccc9c5', {debug: true, ignore_dnt: true}); 
	//...

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
				aligns={aligns}
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