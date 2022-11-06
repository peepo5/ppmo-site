<script>
	import { Router, Route } from "svelte-navigator";
	import Home from "./Home.svelte";
	import x from  "../components/trash/x.svelte";
	import Chapter from "../components/Chapter.svelte";

	// Chapters (English)
	import C0_EN from "../markdown/english/0. Prefix.md";
	import C1_EN from "../markdown/english/1. Introduction.md";
	import C2_EN from "../markdown/english/2. Benefits.md";
	import C3_EN from "../markdown/english/3. Ownership.md";
	import C4_EN from "../markdown/english/4. Desire.md";
	import C5_EN from "../markdown/english/5. Nature.md";
	import C6_EN from "../markdown/english/6. Neurology.md";
	import C7_EN from "../markdown/english/7. Brainwashing.md";
	import C8_EN from "../markdown/english/8. Neuroplasticity.md";
	import C9_EN from "../markdown/english/9. Transmutation.md";
	import C10_EN from "../markdown/english/10. Moving On.md";
	import C11_EN from "../markdown/english/11. Freedom.md";

	// Chapters (French)
	import C0_FR from "../markdown/french/0. Préfixe.md";
	import C1_FR from "../markdown/french/1. Introduction.md";
	import C2_FR from "../markdown/french/2. Bénéfices.md";
	import C3_FR from "../markdown/french/3. L'appropriation.md";
	import C4_FR from "../markdown/french/4. Désirer.md";
	import C5_FR from "../markdown/french/5. Nature.md";
	import C6_FR from "../markdown/french/6. Neurologie.md";
	import C7_FR from "../markdown/french/7. Lavage De Cerveau.md";
	import C8_FR from "../markdown/french/8. Neuroplasticité.md";
	import C9_FR from "../markdown/french/9. Transmutation.md";
	import C10_FR from "../markdown/french/10. Aller De L'Avant.md";
	import C11_FR from "../markdown/french/11. Liberté.md";

	// Chapters (Russian)
	import C0_RU from "../markdown/russian/0. Префикс.md";
	import C1_RU from "../markdown/russian/1. Вступление.md";
	import C2_RU from "../markdown/russian/2. Преимущества.md";
	import C3_RU from "../markdown/russian/3. Собственность.md";
	import C4_RU from "../markdown/russian/4. Стремление.md";
	import C5_RU from "../markdown/russian/5. Природа.md";
	import C6_RU from "../markdown/russian/6. Нейрология.md";
	import C7_RU from "../markdown/russian/7. Промывание мозгов.md";
	import C8_RU from "../markdown/russian/8. Нейропластичность.md";
	import C9_RU from "../markdown/russian/9. Трансмутация.md";
	import C10_RU from "../markdown/russian/10. Продолжение Жизни.md";
	import C11_RU from "../markdown/russian/11. Свобода.md";

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

	let languages = {
		english: {
			name: "english",
			title_name: "English",
			native_name: "english",
			native_title_name: "English",
			short_name: "en",
			tsn: "EN"
		},
		french: {
			name: "french",
			title_name: "French",
			native_name: "français",
			native_title_name: "Français",
			short_name: "fr",
			tsn: "FR"
		},
		russian: {
			name: "russian",
			title_name: "Russian",
			native_name: "русский",
			native_title_name: "Русский",
			short_name: "ru",
			tsn: "RU"
		}
	}

	let chapters_en = [
		{
			name: "Prefix",
			title: "New Beginnings.",
			md: C0_EN
		},
		{
			name: "Introduction",
			title: "Introduction",
			subtitle: "Welcome to the book.",
			md: C1_EN
		},
		{
			name: "Benefits",
			title: "Benefits",
			subtitle: "Benefits or removal of negatives?",
			md: C2_EN
		},
		{
			name: "Ownership",
			title: "Ownership",
			subtitle: "You must own your problems.",
			md: C3_EN
		},
		{
			name: "Desire",
			title: "Desire",
			subtitle: "The thing which achieves dreams.",
			md: C4_EN
		},
		{
			name: "Nature",
			title: "Human Nature",
			subtitle: "Our inherent way of functioning.",
			md: C5_EN
		},
		{
			name: "Neurology",
			title: "Neurology",
			subtitle: "How the chemicals in our brains work.",
			md: C6_EN
		},
		{
			name: "Brainwashing",
			title: "Brainwashing",
			subtitle: "Going over the untruths.",
			md: C7_EN
		},
		{
			name: "Neuroplasticity",
			title: "Neuroplasticity",
			subtitle: "Processes and reactions.",
			md: C8_EN
		},
		{
			name: "Transmutation",
			title: "Transmutation",
			subtitle: "Going over important topics.",
			md: C9_EN
		},
		{
			name: "Moving On",
			title: "Moving On",
			subtitle: "You have to put yourself first.",
			md: C10_EN
		},
		{
			name: "Freedom",
			title: "Freedom",
			subtitle: "Forever onwards.",
			md: C11_EN
		},
	];

	let chapters_fr = [
		{
			name: "Préfixe",
			title: "Nouveaux départs.",
			md: C0_FR
		},
		{
			name: "Introduction",
			title: "Introduction",
			subtitle: "Bienvenue dans le livre.",
			md: C1_FR
		},
		{
			name: "Bénéfices",
			title: "Bénéfices",
			subtitle: "Avantages ou suppression des points négatifs ?",
			md: C2_FR
		},
		{
			name: "L'appropriation",
			title: "L'appropriation",
			subtitle: "Vous devez vous approprier vos problèmes.",
			md: C3_FR
		},
		{
			name: "Désirer",
			title: "Désirer",
			subtitle: "La chose qui réalise les rêves.",
			md: C4_FR
		},
		{
			name: "Nature",
			title: "Nature Humaine",
			subtitle: "Notre façon inhérente de fonctionner.",
			md: C5_FR
		},
		{
			name: "Neurologie",
			title: "Neurologie",
			subtitle: "Le fonctionnement des substances chimiques dans notre cerveau.",
			md: C6_FR
		},
		{
			name: "Lavage De Cerveau",
			title: "Lavage De Cerveau",
			subtitle: "Passer en revue les contre vérités.",
			md: C7_FR
		},
		{
			name: "Neuroplasticité",
			title: "Neuroplasticité",
			subtitle: "Processus et réactions.",
			md: C8_FR
		},
		{
			name: "Transmutation",
			title: "Transmutation",
			subtitle: "Notes de clôture.",
			md: C9_FR
		},
		{
			name: "Aller De L'Avant",
			title: "Aller De L'Avant",
			subtitle: "Vous devez d'abord vous privilégier vous-même.",
			md: C10_FR
		},
		{
			name: "Liberté",
			title: "Liberté",
			subtitle: "À tout jamais",
			md: C11_FR
		},
	];

	let chapters_ru = [
		{
			name: "Префикс",
			title: "Новые начинания.",
			md: C0_RU
		},
		{
			name: "Вступление",
			title: "Вступление",
			subtitle: "Добро пожаловать в книгу.",
			md: C1_RU
		},
		{
			name: "Преимущества",
			title: "Преимущества",
			subtitle: "Преимущество или избавление от минусов?",
			md: C2_RU
		},
		{
			name: "Собственность",
			title: "Собственность",
			subtitle: "Вы должны нести ответственность за свои проблемы.",
			md: C3_RU
		},
		{
			name: "Стремление",
			title: "Стремление",
			subtitle: "Вещь которая достигает свою мечту.",
			md: C4_RU
		},
		{
			name: "Природа",
			title: "Природа",
			subtitle: "Наш естественный способ функционирования.",
			md: C5_RU
		},
		{
			name: "Нейрология",
			title: "Нейрология",
			subtitle: "Как химия работает в нашей голове.",
			md: C6_RU
		},
		{
			name: "Промывание мозгов",
			title: "Промывание мозгов",
			subtitle: "Проходим через неправды.",
			md: C7_RU
		},
		{
			name: "Нейропластичность",
			title: "Нейропластичность",
			subtitle: "Процессы и реакции.",
			md: C8_RU
		},
		{
			name: "Трансмутация",
			title: "Трансмутация",
			subtitle: "Обсуждаем важные темы.",
			md: C9_RU
		},
		{
			name: "Продолжение Жизни",
			title: "Продолжение Жизни",
			subtitle: "Поставьте себя на первое место.",
			md: C10_RU
		},
		{
			name: "Свобода",
			title: "Свобода",
			subtitle: "Далее и навсегда.",
			md: C11_RU
		},
	];

	let chapter_langs = {
		english: {
			chaps: chapters_en
		},
		french: {
			chaps: chapters_fr
		},
		russian: {
			chaps: chapters_ru
		}
	};

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

	let active_language = "english";
	let tmp = localStorage.getItem("active_language");
	if (tmp != undefined) {
		active_language = tmp;
	}

	let translation_index = {
		"chapter": {
			en: "Chapter",
			fr: "Chapitre",
			ru: "Глава"
		},
		"visit-chapter": {
			fr: "Aller Au Chapitre",
			en: "Visit Chapter",
			ru: "Посетить главу"
		},
		"visit-home": {
			en: "Visit Home",
			fr: "Visiter L'accueil",
			ru: "На главную"
		},
		"open-languages": {
			en: "Open Languages",
			fr: "Ouvrir Les Langues",
			ru: "Открыть настройки языков"
		},
		"open-settings": {
			en: "Open Settings",
			fr: "Ouvrir Les Paramètres",
			ru: "Открыть настройки"
		},
		"theme": {
			en: "Theme",
			fr: "Thème",
			ru: "Тема"
		},
		"font": {
			en: "Font",
			fr: "Police",
			ru: "Шрифт"
		},
		"alignment": {
			en: "Alignment",
			fr: "Alignement",
			ru: "Ориентация"
		},
		"settings": {
			en: "Settings",
			fr: "Paramètres",
			ru: "Настроки"
		},
		"languages": {
			en: "Languages",
			fr: "Langues",
			ru: "Языки"
		},
		"language": {
			en: "Language",
			fr: "Langue",
			ru: "Язык"
		},
		"download-the-book": {
			en: "Download the book (download options)",
			fr: "Télécharger le livre (option de téléchargement)",
			ru: "Скачать книгу (опции загрузки)"
		},
		"downloads": {
			en: "Downloads",
			fr: "Téléchargements",
			ru: "Скачать"
		},
		"doc-info": {
			en: "PDF is better for physical copies. EPUB is best for mobile devices, and ZIP/MD is best for copying text from the book.",
			fr: "Le format PDF est préférable pour les copies physiques. EPUB est le meilleur pour les appareils mobiles, et ZIP/MD est le meilleur pour copier le texte du livre.",
			ru: "PDF лучше для физических копий. EPUB лучше для мобильных устройств, а ZIP/MD лучше что бы копировать текст из книги."
		},
		"description-p1": {
			en: "Freedom comes from understanding.",
			fr: "La liberté vient de la compréhension.",
			ru: "Свобода приходит из понимания."
		},
		"description-p2": {
			en: "A book to become free from the porn and masturbation trap.",
			fr: "Un Livre pour se libérer du piège du porno et de la masturbation.",
			ru: "Книга которая поможет вам стать свободными от ловушки порно и мастурбации."
		},
		"read-the-book": {
			en: "Read the book",
			fr: "Lire le livre",
			ru: "Читать книгу"
		},
		"physical-copy": {
			en: "Physical Copy",
			fr: "Copie physique",
			ru: "Физическая копия"
		},
		"donate": {
			en: "Donate",
			fr: "Faire un don",
			ru: "Пожертвовать"
		},
		"donate-info": {
			en: "Donate to help out the project.",
			fr: "Faire un don pour aider le projet.",
			ru: "Пожертвовать на поддержание проекта."
		},
		"physical-info": {
			en: "Print on demand. Discrete branding. No profit made on this. Use code THANKYOU20.",
			fr: "Impression à la demande. Marque discrète. Aucun profit n'est réalisé. Utilisez le code THANKYOU20.",
			ru: "Разрешается печатать. Проект не зарабатывает на материале. Используйте код THANKYOU20."
		},
		"pmo-name-info": {
			en: "ppmo stands for purge PMO.",
			fr: "ppmo signifie purger la PMO.",
			ru: "ppmo означает очищение от pmo."
		},
		"audio-info": {
			en: "Some fitting audio. From Lil Darkie - Dreaming.",
			fr: "Un son adapté. De Lil Darkie - Dreaming.",
			ru: "Подходящая музыка. От Lil Darkie - Dreaming."
		},
		"mark-done": {
			en: "Mark Done",
			fr: "Marquer comme lu",
			ru: "Полный"
		},
		"next-chapter": {
			en: "Next Chapter",
			fr: "Chapitre suivant",
			ru: "Следующая глава"
		},
		"completed": {
			en: "Completed",
			fr: "Terminé",
			ru: "Завершено"
		},
		"resets": {
			en: "Resets all completed chapters",
			fr: "Réinitialiser tous les chapitres",
			ru: "Сбросить все пройденные главы"
		},
		"donate-opn": {
			en: "Donate via opencollective",
			fr: "Faire un don via opencollective",
			ru: "Пожертвование через opencollective"
		},
		"mark-info": {
			en: "Mark the current chapter complete",
			fr: "Marquer le chapitre en cours comme étant terminé",
			ru: "Отметить данную главу завершенной"
		},
		"menu": {
			en: "Menu",
			fr: "Menu",
			ru: "Меню"
		},
		"choose-your-language": {
			en: "Choose your language.",
			fr: "Choississez votre langue.",
			ru: "Выберете язык."
		},
		"trol": {
			en: "Close (duh?)",
			fr: "Fermer (duh?)",
			ru: "Закрыть (мда?)"
		},
		"gh": {
			en: "Visit project GitHub (source code)",
			fr: "Visiter le projet GitHub (code source)",
			ru: "Посестите проект на GitHub (исходный код)"
		},
		"close-menu": {
			en: "Close Menu",
			fr: "Fermer le menu",
			ru: "Закрыть меню"
		},
		"pdf-info": {
			en: "Standard Light Background PDF (Portable Document Format) file",
			fr: "Fichier PDF (Portable Document Format) standard à fond clair",
			ru: "Стандартный со светлым фоном PDF (Portable Document Format) файл"
		},
		"epub-info": {
			en: "Standard EPUB (Electronic Publication) file. EPUB is good for mobile devices.",
			fr: "Fichier standard EPUB (publication électronique). EPUB est bon pour les appareils mobiles.",
			ru: "Стандартный EPUB (Electronic Publication) файл. EPUB хорошо работает для мобильных утройств."
		},
		"epub-dark-info": {
			en: "Dark Background EPUB (Electronic Publication) file. EPUB is good for mobile devices.",
			fr: "Fichier EPUB (Electronic Publication) à fond noir. EPUB est bon pour les appareils mobiles.",
			ru: "Файл EPUB (Electronic Publication) с темным фоном. EPUB хорошо работает для мобильных устройств."
		},
		"md-info": {
			en: "Merged markdown. Right click when you visit page to download.",
			fr: "Fusion de markdown. Cliquez à droite lorsque vous visitez la page pour télécharger.",
			ru: "Merged markdown. Нажмите правой кнопкой мыши по странице для скачивания."
		},
		"zip-info": {
			en: "Zipped markdown files.",
			fr: "Fichiers markdown zippés.",
			ru: "Заархивированные markdown файлы."
		},
		"reset-all": {
			en: "Reset All",
			fr: "Effacer Tout",
			ru: "Сбросить все"
		},
		"hidden-section": {
			en: "Hidden Section",
			fr: "Partie Cachée",
			ru: "Скрытый раздел"
		},
		"lang-disclaim": {
			en: "Visit translations tab in the book to change language.",
			fr: "Visitez l'onglet traductions dans le livre pour changer de langue.",
			ru: "Посетите вкладку переводов в книге, чтобы изменить язык."
		},
		"audiobook": {
			en: "Audiobook",
			fr: "Livre audio",
			ru: "Аудиокнига"
		},
		"audiobook-info": {
			en: "Listen to the full audiobook.",
			fr: "Écouter le livre audio complet.",
			ru: "Слушайте полную аудиокнигу."
		}
	};

	/*
	"": {
			en: "",
			fr: "",
			ru: ""
		}

	*/

</script>

<Router primary={false}>
	<main>

	{#each chapter_langs[active_language].chaps as chapter, i}
		<Route path="chapter/{i.toString()}">
			<Chapter
				chapter={i}
				title={chapter.title}
				subtitle={chapter.subtitle}
				md={chapter.md}
				themes={themes}
				chapters={chapter_langs[active_language].chaps}
				fonts={fonts}
				aligns={aligns}
				language_info={languages[active_language]}
				translation_index={translation_index}
				languages={languages}
			/>
		</Route>
	{/each}

	<Route path="/">
		<Home 
			translation_index={translation_index}
			language_info={languages[active_language]}
		/>
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