{**
 * templates/frontend/pages/issueArchive.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display a list of recent issues.
 *
 * @uses $issues Array Collection of issues to display
 *}
{capture assign="pageTitle"}
	{if $prevPage}
		{translate key="archive.archivesPageNumber" pageNumber=$prevPage+1}
	{else}
		{translate key="archive.archives"}
	{/if}
{/capture}
{include file="frontend/components/header.tpl" pageTitleTranslated=$pageTitle}

<section class="bg-primary py-8">
	<div class="container mx-auto animate-fadeIn">
		{include file="frontend/components/breadcrumbs.tpl" currentTitle=$pageTitle}
		<h1 class="text-2xl font-bold text-white mt-0">Issue Archive</h1>
	</div>
</section>

<section class="bg-white py-12">
	<div class="container mx-auto">

		{if $isUserLoggedIn}
			<div id="timeline-login-App" class="mb-8">
				<timeline></timeline>
			</div>
		{else}
			<div id="timeline-App" class="mb-8">
				<timeline></timeline>
			</div>
		{/if}

		{* No issues have been published
		{if $issues->wasEmpty()}
			<p>{translate key="current.noCurrentIssueDesc"}</p>
		{else}
			<div class="grid grid-cols-1 md:grid-cols-4 gap-8 issues_archive">
				{iterate from=issues item=issue}
					{if $issue->getYear() != $lastYear}
						<li><h3 class="text-lg font-bold mt-4 mb-2">{$issue->getYear()|escape}</h3></li>
						{assign var=lastYear value=$issue->getYear()}
					{/if}
					<div>
						{include file="frontend/objects/issue_summary.tpl"}
					</div>
				{/iterate}
			</div>

			{if $issues->getPageCount() > 0}
				<div class="cmp_pagination mt-8">
					{page_info iterator=$issues}
					{page_links anchor="issues" name="issues" iterator=$issues}
				</div>
			{/if}
		{/if}

		*}

	</div>
</section>

{include file="frontend/components/footer.tpl"}
