{**
 * templates/frontend/pages/indexJournal.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the index page for a journal
 *
 * @uses $currentJournal Journal This journal
 * @uses $journalDescription string Journal description from HTML text editor
 * @uses $homepageImage object Image to be displayed on the homepage
 * @uses $additionalHomeContent string Arbitrary input from HTML text editor
 * @uses $announcements array List of announcements
 * @uses $numAnnouncementsHomepage int Number of announcements to display on the
 *       homepage
 * @uses $issue Issue Current issue
 * @uses $issueIdentificationString string issue identification that relies on user's settings
 *}

{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

<section class="relative bg-primary py-12 md:py-20 overflow-clip w-full js-scrollcontainer inset-shadow-sm inset-shadow-white/50">
<div className="absolute inset-0 w-full h-full bg-[radial-gradient(#ffffff33_1px,#13335c_1px)] bg-[size:25px_25px] "></div>
<div id="ripple-container"></div>		
<canvas
		id="globe-container"
		class="absolute -right-50 -top-10 z-1 touch-none js-cobe w-[1000px] h-[1000px]"
		width="1000"
		height="1000"
	></canvas>

  <div class="container max-w-7xl max-w-7xl mx-auto flex flex-col md:flex-row items-center gap-10 px-4 sm:px-6 lg:px-8 relative z-10">

	<div class="w-full md:w-1/2 flex flex-col items-start justify-center text-white animate-fadeIn">
	  <h1 class="text-3xl md:text-6xl font-serif font-base mb-4 drop-shadow-lg">{$displayPageHeaderTitle|escape}</h1>
	  {if $journalDescription}
		<div class="text-lg md:text-xl font-sans mb-6 text-blue-100/90 max-w-xl">
		  {$journalDescription|strip_unsafe_html|truncate:300}
		</div>
		<div class="flex flex-row gap-3 mt-2">
				<a href="{url router=$smarty.const.ROUTE_PAGE page='about' op='subscriptions'}" class="inline-block px-6 py-3 bg-accent text-white font-semibold rounded shadow hover:bg-accent-dark transition-colors text-base order-first">
			{translate key="plugins.themes.comparativ.common.subscribe"}
		  </a>
		  <a href="{url router=$smarty.const.ROUTE_PAGE page="about"}" class="inline-block px-6 py-3 bg-white/20 text-white font-semibold rounded shadow border border-white/20 hover:bg-white/40 transition-colors text-base">
			{translate key="plugins.themes.comparativ.more-info"}
		  </a>
		</div>
	  {/if}
	</div>
  </div>
</section>

<main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8" id="main">
	{if $journalDescription or $announcements}
	<header class="flex flex-col md:flex-row gap-8">
		{if $journalDescription}
			<div class="w-full md:w-1/2">
			   <section class="journal-desc bg-white/80 border border-gray-200 rounded-lg shadow p-6 mb-6">
				   <h2 class="text-xl font-bold mb-4 flex items-center gap-2">
					   
					   {translate key="plugins.themes.comparativ.issues.current"}
				   </h2>
				   {if $issue}
					   <article class="flex flex-col gap-2">
						   <div class="flex flex-col md:flex-row md:items-center md:gap-4">
							   <h3 class="font-serif text-lg font-semibold text-gray-800 mb-1 md:mb-0">
								   <a href="{url page='issue' op='view' path=$issue->getBestIssueId()}" class="hover:underline text-primary">
									   {if $issueIdentificationString|strip_unsafe_html}{$issueIdentificationString|strip_unsafe_html}{else}{$issue->getLocalizedTitle()|escape}{/if}
								   </a>
							   </h3>
						   </div>
						   <div class="text-xs text-gray-400 mb-1">
							   {if $issue->getIssueIdentification()}
								   {$issue->getIssueIdentification()|strip_unsafe_html|regex_replace:'/\\)[^)]*$/':')'}
							   {/if}
						   </div>
						   {if $issue->getLocalizedDescription()}
							   <p class="text-gray-700 text-sm mb-2">{$issue->getLocalizedDescription()|strip_unsafe_html|truncate:300}</p>
						   {else}
							   <p class="text-gray-400 text-sm mb-2">{translate key="plugins.themes.comparativ.issues.noDescription"}</p>
						   {/if}
						   <div>
							   <a href="{url page='issue' op='view' path=$issue->getBestIssueId()}" class="inline-block px-4 py-2 bg-primary text-white font-semibold rounded shadow hover:bg-accent-dark transition mt-2">
								   {translate key="plugins.themes.comparativ.issues.viewCurrent"}
							   </a>
						   </div>
					   </article>
				   {else}
					   <p class="text-gray-500 italic">{translate key="plugins.themes.comparativ.issues.noCurrent"}</p>
				   {/if}
			   </section>
			</div>
		{/if}

		{if $numAnnouncementsHomepage && $announcements|@count}
		<div class="w-full md:w-1/2">
			<aside class="bg-gray-100 p-6 rounded shadow announcement__content_boxed">
				<h2 class="text-xl font-semibold mb-4">{translate key="announcement.announcements"}</h2>
				<div class="flex flex-col gap-6">
					{foreach name=announcements from=$announcements item=announcement}
						{if $smarty.foreach.announcements.iteration > $numAnnouncementsHomepage}
							{break}
						{/if}
						<article class="announcement-item block">
							<h3 class="font-bold text-base mb-1">{$announcement->getLocalizedData('title')|escape}</h3>
							<p class="text-xs text-gray-500 mb-2">{$announcement->datePosted|date_format:$dateFormatLong}</p>
							<p>{$announcement->getLocalizedData('descriptionShort')|strip_unsafe_html}</p>
							<p class="mt-2">
								{capture assign="announcementPageUrl"}{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->id}{/capture}
							</p>
						</article>
					{/foreach}
				</div>
			</aside>
		</div>
		{/if}
	</header>
	{/if}


</main>

{include file="frontend/components/footer.tpl"}
