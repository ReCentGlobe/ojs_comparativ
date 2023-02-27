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

<section class="uk-section-primary uk-section uk-section-small" uk-scrollspy="&#123;&quot;target&quot;:&quot;[uk-scrollspy-class]&quot;,&quot;cls&quot;:&quot;uk-animation-fade&quot;,&quot;delay&quot;:100&#125">

		<div class="uk-container">
      {* Display a message if no current issue exists *}
      {if !$issue}
        {include file="frontend/components/breadcrumbs_issue.tpl" currentTitleKey="current.noCurrentIssue"}
        {* Display an issue with the Table of Contents *}
      {else}
        {include file="frontend/components/breadcrumbs_issue.tpl" currentTitle=$issueIdentification}
      {/if}

			<h1 class="uk-h2 uk-margin-remove-top" uk-scrollspy-class>
        {$issue->getLocalizedTitle()|escape}
			</h1>


				<h2 class="uk-h4 uk-margin" uk-scrollspy-class>
          {$issueSeries|escape}
				</h2>


		</div>

</section>

<section class="uk-section-default uk-section uk-section-medium" uk-scrollspy="&#123;&quot;target&quot;:&quot;[uk-scrollspy-class]&quot;,&quot;cls&quot;:&quot;uk-animation-fade&quot;,&quot;delay&quot;:200&#125">

	{* Display a message if no current issue exists *}
	{if !$issue}
		{include file="frontend/components/notification.tpl" type="warning" messageKey="current.noCurrentIssueDesc"}

	{* Display an issue with the Table of Contents *}
	{else}
		{include file="frontend/objects/issue_toc.tpl"}
	{/if}
</section>

{include file="frontend/components/footer.tpl"}
