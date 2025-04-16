{**
 * templates/frontend/pages/searchAuthorDetails.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Index of published articles by author.
 *
 *}
{strip}
{assign var="pageTitle" value="search.authorDetails"}
{include file="frontend/components/header.tpl"}
{/strip}
<div id="authorDetails" class="max-w-3xl mx-auto py-8">
<h3 class="text-xl font-bold mb-4">{$lastName|escape}, {$firstName|escape}{if $middleName} {$middleName|escape}{/if}{if $affiliation}, {$affiliation|escape}{/if}{if $country}, {$country|escape}{/if}</h3>
<ul class="space-y-4">
{foreach from=$publishedArticles item=article}
	{assign var=issueId value=$article->getIssueId()}
	{assign var=issue value=$issues[$issueId]}
	{assign var=issueUnavailable value=$issuesUnavailable.$issueId}
	{assign var=sectionId value=$article->getSectionId()}
	{assign var=journalId value=$article->getJournalId()}
	{assign var=journal value=$journals[$journalId]}
	{assign var=section value=$sections[$sectionId]}
	{if $issue->getPublished() && $section && $journal}
	<li class="bg-white rounded shadow p-4">

		<em><a href="{url journal=$journal->getPath() page="issue" op="view" path=$issue->getBestIssueId()}" class="text-primary hover:underline">{$issue->getIssueIdentification()|strip_unsafe_html|nl2br}</a> - {$section->getLocalizedTitle()|escape}</em><br />
		<span class="font-semibold">{$article->getLocalizedTitle()|strip_unsafe_html}</span><br/>
		<a href="{url journal=$journal->getPath() page="article" op="view" path=$article->getBestId()}" class="file text-accent hover:underline">{if $article->getLocalizedAbstract()}{translate key="article.abstract"}{else}{translate key="article.details"}{/if}</a>

		{if (!$issueUnavailable || $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN)}

		{foreach from=$article->getGalleys() item=galley name=galleyList}
			&nbsp;<a href="{url journal=$journal->getPath() page="article" op="view" path=$article->getBestId()|to_array:$galley->getBestGalleyId()}" class="file text-xs text-primary hover:underline">{$galley->getGalleyLabel()|escape}</a>
		{/foreach}
		{/if}
	</li>
	{/if}
{/foreach}
</ul>
</div>
{include file="frontend/components/footer.tpl"}

