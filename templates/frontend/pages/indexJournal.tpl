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

<main class="max-w-7xl mx-auto px-4 py-8" id="main">
	{if $journalDescription or $announcements}
	<header class="flex flex-col md:flex-row gap-8">
		{if $homepageImage}
		<figure class="w-full md:w-1/2 rounded overflow-hidden" style="background-color: {$baseColour};">
			<img src="{$publicFilesDir}/{$homepageImage.uploadName|escape:'url'}"{if $homepageImage.altText} alt="{$homepageImage.altText|escape}"{/if}
				class="w-full object-cover mix-blend-luminosity"
			/>
			<hr class="my-4 border-t border-gray-300"/>
		</figure>
		{/if}
		{if $journalDescription}
			<div class="w-full md:w-1/2">
				<section class="journal-desc">
					<h2 class="text-lg font-semibold text-gray-700">{$displayPageHeaderTitle|escape}</h2>
					<article>
						<h3 class="text-base font-bold mb-2">{translate key="about.aboutContext"}</h3>
						{$journalDescription|strip_unsafe_html|truncate:450}
						<p class="mt-4">
							{capture assign="aboutPageUrl"}{url router=$smarty.const.ROUTE_PAGE page="about"}{/capture}
							<a href="{$aboutPageUrl}" class="inline-block px-4 py-2 bg-primary text-white rounded hover:bg-accent transition">{translate key="plugins.themes.pragma.more-info"}</a>
						</p>
					</article>
				</section>
			</div>
		{/if}

		{if $numAnnouncementsHomepage && $announcements|@count}
		<div class="w-full md:w-1/2">
			<aside class="bg-gray-100 p-4 rounded shadow announcement__content_boxed">
				<h2 class="text-lg font-semibold mb-4">{translate key="announcement.announcements"}</h2>
				<div class="space-y-6">
					{foreach name=announcements from=$announcements item=announcement}
						{if $smarty.foreach.announcements.iteration > $numAnnouncementsHomepage}
							{break}
						{/if}
						<article class="{if $announcement@first}block{else}hidden{/if} announcement-item">
							<h3 class="font-bold text-base mb-1">{$announcement->getLocalizedData('title')|escape}</h3>
							<p class="text-xs text-gray-500 mb-2">{$announcement->datePosted|date_format:$dateFormatLong}</p>
							<p>{$announcement->getLocalizedData('descriptionShort')|strip_unsafe_html}</p>
							<p class="mt-2">
								{capture assign="announcementPageUrl"}{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->id}{/capture}
								<a href="{$announcementPageUrl}" class="inline-block px-3 py-1 bg-primary text-white rounded hover:bg-accent transition">{translate key="common.more"}</a>
							</p>
						</article>
					{/foreach}
				</div>
				{if $numAnnouncementsHomepage > 1 && $announcements|@count > 1}
					<div class="flex justify-end gap-2 mt-4">
						<a href="#announcementsCarouselControls" class="px-2 py-1 bg-gray-200 rounded hover:bg-gray-300" role="button" data-bs-slide="prev">
							<span aria-hidden="true">←</span>
							<span class="sr-only">{translate key="help.next"}</span>
						</a>
						<a href="#announcementsCarouselControls" class="px-2 py-1 bg-gray-200 rounded hover:bg-gray-300" role="button" data-bs-slide="next">
							<span aria-hidden="true">→</span>
							<span class="sr-only">{translate key="help.previous"}</span>
						</a>
					</div>
				{/if}
			</aside>
		</div>
		{/if}
	</header>
	{/if}
	<section class="issue mt-8">

		{call_hook name="Templates::Index::journal"}

		{* Latest issue *}
		{if $issue}
			{include file="frontend/objects/issue_toc.tpl"}
		{/if}

	</section>

	{* Recent issues *}
	{if ($recentIssues && !empty($recentIssues))}
		<hr class="my-8 border-t border-gray-300"/>
		<section class="recent-issues">
			<h3 class="text-lg font-semibold mb-4">{translate key="plugins.themes.pragma.issues.recent"}</h3>
			<div class="flex flex-wrap -mx-2">
				{foreach from=$recentIssues item=recentIssue}
					<article class="w-1/2 md:w-1/4 px-2 mb-6 recent-issues__item">
						<h4 class="font-bold text-base mb-1 recent-issues__issue-title">
							<a href="{url page='issue' op='view' path=$recentIssue->getBestIssueId()}" class="text-primary hover:underline">{$recentIssue->getIssueIdentification()|strip_unsafe_html}</a>
						</h4>
						<p class="text-xs text-gray-500">{$recentIssue->getDatePublished()|date_format:$dateFormatLong}</p>
					</article>
				{/foreach}
			</div>
		</section>
	{/if}

	{* Additional Homepage Content *}
	{if $additionalHomeContent}
		<hr class="my-8 border-t border-gray-300"/>
		<section class="additional-content">
			<div class="flex">
				<div class="w-full md:w-2/3">
					{$additionalHomeContent|strip_unsafe_html}
				</div>
			</div>
		</section>
	{/if}

</main>

{include file="frontend/components/footer.tpl"}
