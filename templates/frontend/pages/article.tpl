{**
 * templates/frontend/pages/article.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view an article with all of it's details.
 *
 * @uses $article Article This article
 * @uses $issue Issue The issue this article is assigned to
 * @uses $section Section The journal section this article is assigned to
 * @uses $journal Journal The journal currently being viewed.
 * @uses $primaryGalleys array List of article galleys that are not supplementary or dependent
 * @uses $supplementaryGalleys array List of article galleys that are supplementary
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$article->getLocalizedTitle()|escape}

<section class="uk-section-primary uk-section uk-section-small" uk-scrollspy="&#123;&quot;target&quot;:&quot;[uk-scrollspy-class]&quot;,&quot;cls&quot;:&quot;uk-animation-fade&quot;,&quot;delay&quot;:100&#125">

	<div class="uk-container">
		{if $section}
			{include file="frontend/components/breadcrumbs_article.tpl" currentTitle=$section->getLocalizedTitle()}
		{else}
			{include file="frontend/components/breadcrumbs_article.tpl" currentTitleKey="article.article"}
		{/if}

		<h1 class="uk-h2 uk-margin-remove-top" uk-scrollspy-class>
			{$article->getLocalizedTitle()|escape}
		</h1>


		{if $article->getLocalizedSubtitle()}
			<h2 class="uk-h4 uk-margin" uk-scrollspy-class>
				{$article->getLocalizedSubtitle()|escape}
			</h2>
		{/if}

		{if $article->getAuthors()}
			<ul class="uk-list item authors" uk-scrollspy-class>
				{foreach from=$article->getAuthors() item=author}
					<li class="is-inline">
							<span class="name">
								{$author->getFullName()|escape}
							</span>
						{if $author->getLocalizedAffiliation()}
							<span class="affiliation">
									{$author->getLocalizedAffiliation()|escape}
								</span>
						{/if}
						{if $author->getOrcid()}
							<span class="orcid">
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


<section class="uk-section-default uk-section uk-section-medium" uk-scrollspy="&#123;&quot;target&quot;:&quot;[uk-scrollspy-class]&quot;,&quot;cls&quot;:&quot;uk-animation-fade&quot;,&quot;delay&quot;:200&#125">

	{* Show article overview *}
	{include file="frontend/objects/article_details.tpl"}

	{call_hook name="Templates::Article::Footer::PageFooter"}

</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
