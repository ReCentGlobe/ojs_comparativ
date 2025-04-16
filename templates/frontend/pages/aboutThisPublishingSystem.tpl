{**
 * templates/frontend/pages/aboutThisPublishingSystem.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view details about the OJS software.
 *
 * @uses $currentJournal Journal The journal currently being viewed
 * @uses $appVersion string Current version of OJS
 * @uses $pubProcessFile string Path to image of OJS publishing process
 *}
{include file="frontend/components/header.tpl" pageTitle="about.aboutThisPublishingSystem"}

<div class="page page_about_publishing_system max-w-3xl mx-auto bg-white rounded shadow p-8 my-8">
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.aboutThisPublishingSystem"}

	<p class="mb-6 text-gray-700">
		{if $currentJournal}
			{translate key="about.aboutOJSJournal" ojsVersion=$appVersion}
		{else}
			{translate key="about.aboutOJSSite" ojsVersion=$appVersion}
		{/if}
	</p>

	<img src="{$baseUrl}/{$pubProcessFile}" alt="{translate key="about.aboutThisPublishingSystem.altText"}" class="rounded shadow mx-auto">

</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
