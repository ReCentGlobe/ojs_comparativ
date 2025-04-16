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


{if ($article->getBestId())}
	{assign var=articlePath value=$article->getBestId()}
{/if}

{if (!$section.hideAuthor && $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_DEFAULT) || $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_SHOW}
	{assign var="showAuthor" value=true}
{/if}



{if $article->getLocalizedCoverImage()}
	<figure class="media-left mb-2">
		<a {if $journal}href="{url journal=$journal->getPath() page="article" op="view" path=$articlePath}"{else}href="{url page="article" op="view" path=$articlePath}"{/if} class="block w-16 h-16 overflow-hidden rounded shadow">
			<img src="{$article->getLocalizedCoverImageUrl()|escape}"{if $article->getLocalizedCoverImageAltText() != ''} alt="{$article->getLocalizedCoverImageAltText()|escape}"{else} alt="{translate key="article.coverPage.altText"}"{/if} class="object-cover w-full h-full">
		</a>
	</figure>
{/if}

<div class="grid gap-2">
	<div class="col-span-1">
		<a class="text-primary hover:underline font-semibold" {if $journal}href="{url journal=$journal->getPath() page="article" op="view" path=$articlePath}"{else}href="{url page="article" op="view" path=$articlePath}"{/if}>
			{if $section.title|escape ne "Book Review"}
				{$article->getLocalizedTitle()|strip_unsafe_html}<br>
				{$article->getLocalizedSubtitle()|strip_unsafe_html}
			{else}
				{$article->getLocalizedTitle()|strip_unsafe_html} {$article->getLocalizedSubtitle()|strip_unsafe_html}
			{/if}
		</a>
	</div>
	<div class="col-span-1 text-sm text-gray-600">
		<div class="flex flex-wrap items-center gap-2">
			{if $showAuthor || $article->getPages() || ($article->getDatePublished() && $showDatePublished)}
				{if $showAuthor}
					<div class="text-xs text-gray-500">
						{$article->getAuthorString()}
					</div>
				{/if}
			{/if}
		</div>
	</div>
	<div class="col-span-1 flex flex-wrap items-center justify-between mt-2">
		<a class="text-xs text-accent hover:underline" href="{url page="issue" op="view" path=$issue->getBestIssueId()}">
			{$issue->getIssueIdentification()}
		</a>
		{if $article->getPages()}
			<div class="text-xs text-gray-500">
				{$article->getPages()|escape}
			</div>
		{/if}
	</div>
</div>

  {call_hook name="Templates::Issue::Issue::Article"}



