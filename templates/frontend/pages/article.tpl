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

<section class="bg-primary py-8">

	<div class="container mx-auto">
		{if $section}
			{include file="frontend/components/breadcrumbs_article.tpl" currentTitle=$section->getLocalizedTitle()}
		{else}
			{include file="frontend/components/breadcrumbs_article.tpl" currentTitleKey="common.publication"}
		{/if}

		<h1 class="text-2xl font-bold text-white mt-0 animate-fadeIn">
			{$publication->getLocalizedFullTitle(null, 'html')|strip_unsafe_html}
		</h1>

		{if $publication->getLocalizedData('subtitle')}
			<h2 class="text-lg font-semibold text-white mb-4 animate-fadeIn">
				{$publication->getLocalizedData('subtitle')|strip_unsafe_html}
			</h2>
		{/if}

		{if $publication->getData('authors')}
			<ul class="flex flex-wrap gap-4 item authors animate-fadeIn">
				{foreach from=$publication->getData('authors') item=author}
					<li class="inline-flex items-center gap-2">
							<span class="name font-medium">
								{$author->getFullName()|escape}
							</span>
						{if $author->getLocalizedAffiliation()}
							<span class="affiliation text-xs text-gray-200 ml-2">
								{$author->getLocalizedAffiliation()|escape}
							</span>
						{/if}
						{if $author->getOrcid()}
							<span class="orcid text-xs text-accent ml-2">
								{$orcidIcon}
								<a href="{$author->getOrcid()|escape}" target="_blank">
									{$author->getOrcid()|escape}
								</a>
							</span>
						{/if}
					</li>
				{/foreach}
			</ul>
		{/if}

	</div>

</section>


<section class="bg-white py-12">

	{* Show article overview *}
	{include file="frontend/objects/article_details.tpl"}

	{call_hook name="Templates::Article::Footer::PageFooter"}

</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
