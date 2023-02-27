{**
 * templates/frontend/objects/article_summary.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Article summary which is shown within a list of articles.
 *
 * @uses $article Article The article
 * @uses $hasAccess bool Can this user access galleys for this context? The
 *       context may be an issue or an article
 * @uses $showDatePublished bool Show the date this article was published?
 * @uses $hideGalleys bool Hide the article galleys for this article?
 * @uses $primaryGenreIds array List of file genre ids for primary file types
 *}
{assign var=articlePath value=$article->getBestId()}

{if (!$section.hideAuthor && $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_DEFAULT) || $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_SHOW}
	{assign var="showAuthor" value=true}
{/if}



	{if $article->getLocalizedCoverImage()}
		<figure class="media-left">
			<a {if $journal}href="{url journal=$journal->getPath() page="article" op="view" path=$articlePath}"{else}href="{url page="article" op="view" path=$articlePath}"{/if} class="file image is-64x64">
				<img src="{$article->getLocalizedCoverImageUrl()|escape}"{if $article->getLocalizedCoverImageAltText() != ''} alt="{$article->getLocalizedCoverImageAltText()|escape}"{else} alt="{translate key="article.coverPage.altText"}"{/if}>
			</a>
		</figure>
	{/if}

	<div uk-grid>
		<div class="uk-width-1-1">
					<a class="uk-link-reset" {if $journal}href="{url journal=$journal->getPath() page="article" op="view" path=$articlePath}"{else}href="{url page="article" op="view" path=$articlePath}"{/if}>
						{if $section.title|escape ne "Book Review"}
							{$article->getLocalizedTitle()|strip_unsafe_html}<br>
							{$article->getLocalizedSubtitle()|strip_unsafe_html}
						{else}
							{$article->getLocalizedTitle()|strip_unsafe_html} {$article->getLocalizedSubtitle()|strip_unsafe_html}
						{/if}
					</a>
		</div>
		<div class="uk-width-1-1 uk-margin-small">
			<div uk-grid>
				<div class="uk-flex-first">


{if $article->getAuthors()}
{foreach from=$article->getAuthors() item=author}
					<div class="uk-text-small">
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
					</div>
				{/foreach}
		{/if}

				</div>
			</div>



		</div>

    <div class="uk-width-1-1">
			<div uk-grid>
				<div class="uk-flex-first">
					{if !$hideGalleys}
						<div uk-grid class="">
							{if $article->getLocalizedAbstract()}
								<div class="uk-width-auto">
										<button class="uk-button uk-button-default uk-button-small" type="button" uk-toggle="target: #toggle-{$article->getBestId()}; animation: uk-animation-fade">Abstract</button>
								</div>
							{/if}
							<div class="uk-width-auto">
								{foreach from=$article->getGalleys() item=galley}
									{if $primaryGenreIds}
										{assign var="file" value=$galley->getFile()}
										{if !$file || !in_array($file->getGenreId(), $primaryGenreIds)}
											{continue}
										{/if}
									{/if}
									<div class="">
										{assign var="hasArticleAccess" value=$hasAccess}
										{if $currentContext->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_OPEN || $article->getCurrentPublication()->getData('accessStatus') == $smarty.const.ARTICLE_ACCESS_OPEN}
											{assign var="hasArticleAccess" value=1}
										{/if}


										{include file="frontend/objects/galley_link.tpl" parent=$article hasAccess=$hasArticleAccess purchaseFee=$currentJournal->getSetting('purchaseArticleFee') purchaseCurrency=$currentJournal->getSetting('currency')}
									</div>
								{/foreach}
							</div>
						</div>
					{/if}
				</div>
				<div class="uk-width-expand uk-flex-last uk-text-right">
					{if $article->getPages()}
						<div class="uk-text-small">
							{$article->getPages()|escape}
						</div>
					{/if}
				</div>
			</div>
		</div>

		{if $article->getLocalizedAbstract()}
			<div class="uk-width-1-1">
				<div id="toggle-{$article->getBestId()}" hidden>{$article->getLocalizedAbstract()|strip_unsafe_html}</div>
			</div>
		{/if}
	</div>

  {call_hook name="Templates::Issue::Issue::Article"}


