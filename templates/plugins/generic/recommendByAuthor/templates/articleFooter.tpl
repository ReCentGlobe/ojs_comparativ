{**
 * plugins/generic/recommendByAuthor/templates/articleFooter.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * A template to be included via Templates::Article::Footer::PageFooter hook.
 *}
<div id="articlesBySameAuthorList" class="uk-container uk-margin uk-margin-large uk-margin-remove-horizontal "
     uk-scrollspy="&#123;&quot;target&quot;:&quot;[uk-scrollspy-class]&quot;,&quot;cls&quot;:&quot;uk-animation-fade&quot;,&quot;delay&quot;:300&#125">
    <div uk-grid class="uk-padding uk-padding-remove-horizontal">
        {if $noMetricSelected}
            <h3>{translate key="plugins.generic.recommendByAuthor.heading"}</h3>
            {translate key="plugins.generic.recommendByAuthor.noMetric"}
        {else}


            {if $articlesBySameAuthor|@count}
                <div class="uk-width-1-1">
                    <h4 class="uk-h4 uk-margin uk-heading-bullet">More articles by the same author(s)</h4>
                </div>
                <div class="uk-width-1-1">
                    {foreach from=$articlesBySameAuthor item=articleBySameAuthor}
                        {assign var=publishedArticle value=$articleBySameAuthor.publishedArticle}
                        {assign var=article value=$articleBySameAuthor.article}
                        {assign var=issue value=$articleBySameAuthor.issue}
                        {assign var=journal value=$articleBySameAuthor.journal}
                        <article class="uk-margin-medium uk-margin-remove-top uk-panel uk-article">

                            <div uk-grid uk-scrollspy-class>
                                <div class="uk-width-1-1">
                                    <a class="uk-link-reset"
                                       href="{url journal=$journal->getPath() page="article" op="view" path=$publishedArticle->getBestId()}">
                                        {$article->getLocalizedTitle()|strip_unsafe_html}<br>
                                        {$article->getLocalizedSubtitle()|strip_unsafe_html}
                                    </a>
                                </div>
                                <div class="uk-width-1-1 uk-margin-small">
                                    <div uk-grid>
                                        <div class="uk-flex-first">
                                            {foreach from=$article->getAuthors() item=author}
                                                {$author->getFullName()|escape}
                                            {/foreach}
                                        </div>
                                    </div>


                                </div>


                                <div class="uk-width-1-1">
                                    <div uk-grid>
                                        <div class="uk-flex-first">
                                            <a class="uk-link-reset uk-text-small"
                                               href="{url page="issue" op="view" path=$issue->getBestIssueId()}">
                                                {$issue->getIssueIdentification()}
                                            </a>
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


                        </article>
                        <hr>
                    {/foreach}
                </div>
                <div class="uk-width-1-1">
                    {page_links anchor="articlesBySameAuthor" iterator=$articlesBySameAuthor name="articlesBySameAuthor"}
                </div>
            {/if}
        {/if}
    </div>
</div>
