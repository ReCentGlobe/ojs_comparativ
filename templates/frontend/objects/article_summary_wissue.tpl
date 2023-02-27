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
 * @uses $issues array List of Issue objects the $articles are published in
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
				{if $showAuthor || $article->getPages() || ($article->getDatePublished() && $showDatePublished)}
					{if $showAuthor}
						<div class="uk-text-small">
							{$article->getAuthorString()}
						</div>
					{/if}
				{/if}
			</div>
		</div>



	</div>


	<div class="uk-width-1-1">
		<div uk-grid>
			<div class="uk-flex-first">
				{assign var=articleID value=$article->getData('publications')}

				{foreach from=$issues item=issue}
				
					{if $issue->getBestIssueId() == $articleID[0]->getData('issueId')}
						<a class="uk-link-reset uk-text-small" href="{url page="issue" op="view" path=$issue->getBestIssueId()}">
							{$issue->getIssueIdentification()}
						</a>
					{/if}
					
				{/foreach}

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
</div>

{call_hook name="Templates::Issue::Issue::Article"}




