{**
 * templates/frontend/pages/issue.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display a landing page for a single issue. It will show the table of contents
 *  (toc) or a cover image, with a click through to the toc.
 *
 * @uses $issue Issue The issue
 * @uses $issueIdentification string Label for this issue, consisting of one or
 *       more of the volume, number, year and title, depending on settings
 * @uses $issueGalleys array Galleys for the entire issue
 * @uses $primaryGenreIds array List of file genre IDs for primary types
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$issueIdentification}

<section class="bg-primary py-8">

		<div class="container mx-auto">
      {* Display a message if no current issue exists *}
      {if !$issue}
        {include file="frontend/components/breadcrumbs_issue.tpl" currentTitleKey="current.noCurrentIssue"}
        {* Display an issue with the Table of Contents *}
      {else}
        {include file="frontend/components/breadcrumbs_issue.tpl" currentTitle=$issueIdentification}
      {/if}

			<h1 class="text-2xl font-bold text-white mt-0 animate-fadeIn">
        {$issue->getLocalizedTitle()|escape}
			</h1>


				<h2 class="text-lg font-semibold text-white mb-4 animate-fadeIn">
          {$issueSeries|escape}
				</h2>


		</div>

</section>

<section class="bg-white py-12">

	{* Display a message if no current issue exists *}
	{if !$issue}
		{include file="frontend/components/notification.tpl" type="warning" messageKey="current.noCurrentIssueDesc"}

	{* Display an issue with the Table of Contents *}
	{else}
		{include file="frontend/objects/issue_toc.tpl"}
	{/if}
</section>

{include file="frontend/components/footer.tpl"}
