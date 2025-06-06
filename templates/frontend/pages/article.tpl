{**
 * templates/frontend/pages/article.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view an article with all of it's details.
 *
 * @uses $article Submission This article
 * @uses $publication Publication The publication being displayed
 * @uses $firstPublication Publication The first published version of this article
 * @uses $currentPublication Publication The most recently published version of this article
 * @uses $issue Issue The issue this article is assigned to
 * @uses $section Section The journal section this article is assigned to
 * @uses $journal Journal The journal currently being viewed.
 * @uses $primaryGalleys array List of article galleys that are not supplementary or dependent
 * @uses $supplementaryGalleys array List of article galleys that are supplementary
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$publication->getLocalizedFullTitle(null, 'html')|strip_unsafe_html}

{capture assign="breadcrumbsHtml"}
				{if $section}
					{include file="frontend/components/breadcrumbs_article.tpl" currentTitle=$section->getLocalizedTitle()}
				{else}
					{include file="frontend/components/breadcrumbs_article.tpl" currentTitleKey="common.publication"}
				{/if}
			{/capture}
			{capture assign="subtitleHtml"}
				{if $publication->getLocalizedData('subtitle')}
					{$publication->getLocalizedData('subtitle')|strip_unsafe_html}
				{/if}
			{/capture}
				{assign var=authors value=$publication->getData('authors')}
				{include file="frontend/components/sectionHeader.tpl" breadcrumbs=$breadcrumbsHtml title=$publication->getLocalizedFullTitle(null, 'html')|strip_unsafe_html subtitle=$subtitleHtml authors=$authors orcidIcon=$orcidIcon}


<section class="bg-white container max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">

	{* Show article overview *}
	{include file="frontend/objects/article_details.tpl"}

	{call_hook name="Templates::Article::Footer::PageFooter"}

</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
