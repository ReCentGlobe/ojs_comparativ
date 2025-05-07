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



{assign var=publication value=$article->getCurrentPublication()}
{if $publication->getLocalizedData('coverImage')}
	{assign var="coverImage" value=$publication->getLocalizedData('coverImage')}
	<figure class="media-left mb-2">
		<a {if $journal}href="{url journal=$journal->getPath() page="article" op="view" path=$articlePath}"{else}href="{url page="article" op="view" path=$articlePath}"{/if} class="block w-16 h-16 overflow-hidden rounded shadow">
			<img
				src="{$publication->getLocalizedCoverImageUrl($article->getData('contextId'))|escape}"
				alt="{$coverImage.altText|escape|default:''}"
				class="object-cover w-full h-full"
			>
		</a>
	</figure>
{/if}


<div class="obj_article_summary bg-white rounded-md border border-gray-200 p-6 mb-8 transition hover:border-primary-light hover:bg-primary-lightest">
	{if $publication->getLocalizedData('coverImage')}
		<figure class="media-left mb-4">
			<a {if $journal}href="{url journal=$journal->getPath() page="article" op="view" path=$articlePath}"{else}href="{url page="article" op="view" path=$articlePath}"{/if} class="block w-20 h-20 overflow-hidden rounded-lg border border-gray-100">
				{assign var="coverImage" value=$publication->getLocalizedData('coverImage')}
				<img
					src="{$publication->getLocalizedCoverImageUrl($article->getData('contextId'))|escape}"
					alt="{$coverImage.altText|escape|default:''}"
					class="object-cover w-full h-full"
				>
			</a>
		</figure>
	{/if}

	<h2 class="title text-2xl font-sans font-bold text-gray-900 mb-1 leading-tight">
		<a id="article-{$article->getId()}" {if $journal}href="{url journal=$journal->getPath() page="article" op="view" path=$articlePath}"{else}href="{url page="article" op="view" path=$articlePath}"{/if} class="text-black hover:underline">
			{if $section.title|escape ne "Book Review"}
				{$article->getLocalizedTitle()|strip_unsafe_html}
				{if $article->getLocalizedSubtitle()}
					<span class="subtitle block text-base text-gray-500 font-serif mt-1">{$article->getLocalizedSubtitle()|strip_unsafe_html}</span>
				{/if}
			{else}
				{$article->getLocalizedTitle()|strip_unsafe_html} {$article->getLocalizedSubtitle()|strip_unsafe_html}
			{/if}
		</a>
	</h2>

	<hr class="my-3 border-gray-100">

	{assign var=submissionPages value=$article->getPages()}
	{assign var=submissionDatePublished value=$article->getDatePublished()}
	{if $showAuthor || $submissionPages || ($submissionDatePublished && $showDatePublished)}
	<div class="meta flex flex-wrap gap-4 text-sm text-gray-500 font-serif mb-1">
		{if $showAuthor}
		<div class="authors">
			{$publication->getAuthorString($authorUserGroups)|escape}
		</div>
		{/if}
	</div>
	{/if}

	<div class="flex justify-between items-center mt-4 gap-2">
			<a class="text-xs text-accent hover:underline" href="{url page="issue" op="view" path=$issue->getBestIssueId()}">
				{$issue->getIssueIdentification()}
			</a>
			{if $article->getPages()}
				<div class="text-xs text-primary font-serif bg-primary-lightest px-2 py-1 rounded">
					{$article->getPages()|escape}
				</div>
			{/if}
	</div>
</div>

  {call_hook name="Templates::Issue::Issue::Article"}



