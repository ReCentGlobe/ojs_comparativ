{**
 * plugins/generic/recommendByAuthor/templates/articleFooter.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * A template to be included via Templates::Article::Footer::PageFooter hook.
 *}
<div id="articlesBySameAuthorList" class="max-w-3xl mx-auto my-8">
    {if $noMetricSelected}
        <h3 class="text-lg font-semibold mb-2">{translate key="plugins.generic.recommendByAuthor.heading"}</h3>
        <div class="text-gray-600">{translate key="plugins.generic.recommendByAuthor.noMetric"}</div>
    {else}
        {if $articlesBySameAuthor|@count}
            <div class="w-full">
                <h4 class="text-base font-bold border-l-4 border-primary pl-2 mb-4">More articles by the same author(s)</h4>
            </div>
            <div class="w-full">
                {foreach from=$articlesBySameAuthor item=articleBySameAuthor}
                    {assign var=publishedArticle value=$articleBySameAuthor.publishedArticle}
                    {assign var=article value=$articleBySameAuthor.article}
                    {assign var=issue value=$articleBySameAuthor.issue}
                    {assign var=journal value=$articleBySameAuthor.journal}
                    <article class="my-8 p-4 bg-gray-50 rounded shadow">
                        <div>
                            <a class="text-primary hover:underline" href="{url journal=$journal->getPath() page="article" op="view" path=$publishedArticle->getBestId()}">
                                {$article->getLocalizedTitle()|strip_unsafe_html}<br>
                                {$article->getLocalizedSubtitle()|strip_unsafe_html}
                            </a>
                        </div>
                        <div class="mt-2 text-sm text-gray-600">
                            {foreach from=$article->getAuthors() item=author}
                                {$author->getFullName()|escape}
                            {/foreach}
                        </div>
                    </article>
                {/foreach}
            </div>
        {/if}
    {/else}
</div>
