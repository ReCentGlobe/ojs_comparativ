{**
 * templates/frontend/objects/issue_summary.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Issue which displays a summary for use in lists
 *
 * @uses $issue Issue The issue
 *}
{if $issue->getShowTitle()}
{assign var=issueTitle value=$issue->getLocalizedTitle()}
{/if}
{assign var=issueSeries value=$issue->getIssueSeries()}
{assign var=issueCover value=$issue->getLocalizedCoverImageUrl()}

<div class="obj_issue_summary bg-white rounded shadow p-4 mb-6">
	<div class="mb-2">
		<a href="{url op="view" path=$issue->getBestIssueId()}">
			<img src="{$issueCover|escape}" alt="Placeholder image" class="w-full h-48 object-cover rounded">
		</a>
	</div>
	<div class="media-content">
		<p class="text-lg font-bold text-primary">{$issueSeries|escape}</p>
		<p class="text-sm text-gray-700">{$issueTitle|escape}</p>
	</div>
</div>

</div><!-- .obj_issue_summary -->
