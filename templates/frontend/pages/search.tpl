{**
 * templates/frontend/pages/search.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to search and view search results.
 *
 * @uses $query Value of the primary search query
 * @uses $authors Value of the authors search filter
 * @uses $dateFrom Value of the date from search filter (published after).
 *  Value is a single string: YYYY-MM-DD HH:MM:SS
 * @uses $dateTo Value of the date to search filter (published before).
 *  Value is a single string: YYYY-MM-DD HH:MM:SS
 * @uses $yearStart Earliest year that can be used in from/to filters
 * @uses $yearEnd Latest year that can be used in from/to filters
 *}
{include file="frontend/components/header.tpl" pageTitle="common.search"}



{capture name="breadcrumbs"}
    {include file="frontend/components/breadcrumbs.tpl" currentTitleKey="common.search"}
{/capture}
{include file="frontend/components/sectionHeader.tpl"
    breadcrumbs=$smarty.capture.breadcrumbs
    title={translate key="common.search"}
}

<section class="bg-white py-12">
    <div class="container max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="grid md:grid-cols-3 gap-8">

            <div class="md:col-span-2">
                {* Search results, finally! *}
                <div class="search_results">
                    {if !$results|@count}
                        {* No results found *}
                        {if $error}
                            {include file="frontend/components/notification.tpl" type="error" message=$error|escape}
                        {else}
                            {include file="frontend/components/notification.tpl" type="notice" messageKey="search.noResults"}
                        {/if}
                    {else}
                        <h4 class="text-lg font-semibold mb-6 border-b border-gray-200 pb-2">
                            Results for "{$query}"
                        </h4>
                        {iterate from=results item=result}
                        {assign var=issue value=$result.issue}
                        <article class="mb-8">
                            {include file="frontend/objects/article_search.tpl" article=$result.publishedSubmission journal=$result.journal issue=$result.issue showDatePublished=true hideGalleys=true}
                            <hr>
                        </article>
                        {/iterate}
                    {/if}

                </div>
            </div>

            <div>
                <div class="bg-gray-50 border border-gray-200 rounded-md p-6 shadow-sm mb-8">
                    <h4 class="text-lg font-semibold mb-4 border-b border-gray-200 pb-2 text-primary">{translate key="plugins.themes.comparativ.search.filter"}</h4>
                    {capture name="searchFormUrl"}{url escape=false}{/capture}
                    {assign var=formUrlParameters value=[]}{* Prevent Smarty warning *}
                    {$smarty.capture.searchFormUrl|parse_url:$smarty.const.PHP_URL_QUERY|parse_str:$formUrlParameters}
                    <form class="space-y-6" method="get"
                        action="{$smarty.capture.searchFormUrl|strtok:"?"|escape}">
                        {foreach from=$formUrlParameters key=paramKey item=paramValue}
                            <input type="hidden" name="{$paramKey|escape}" value="{$paramValue|escape}" />
                        {/foreach}
                        {csrf}

                        <div class="search_input mb-4">
                            <label class="block font-semibold mb-2 text-gray-700" for="query">
                                {translate key="search.searchFor"}
                            </label>
                            {block name=searchQuery}
                                <input type="text" id="query" name="query" value="{$query|escape}" class="border border-gray-300 rounded px-3 py-2 w-full focus:ring-2 focus:ring-primary focus:border-primary transition"
                                    placeholder="{translate|escape key="common.search"}">
                            {/block}
                        </div>

                        <fieldset class="search_advanced mb-4 border border-gray-200 rounded p-4 bg-white">
                            <legend class="font-semibold mb-2 text-primary">{translate key="search.advancedFilters"}</legend>
                            <div class="date_range space-y-4">
                                <div class="from">
                                    <label class="block font-medium mb-1 text-gray-700">
                                        {translate key="search.dateFrom"}
                                    </label>
                                    <div class="flex gap-2">
                                        {html_select_date class="border border-gray-300 rounded px-2 py-1 w-auto focus:ring-2 focus:ring-primary focus:border-primary transition" prefix="dateFrom" time=$dateFrom start_year=$yearStart end_year=$yearEnd year_empty="" month_empty="" day_empty="" field_order="YMD"}
                                    </div>
                                </div>
                                <div class="to">
                                    <label class="block font-medium mb-1 text-gray-700">
                                        {translate key="search.dateTo"}
                                    </label>
                                    <div class="flex gap-2">
                                        {html_select_date class="border border-gray-300 rounded px-2 py-1 w-auto focus:ring-2 focus:ring-primary focus:border-primary transition" prefix="dateTo" time=$dateTo start_year=$yearStart end_year=$yearEnd year_empty="" month_empty="" day_empty="" field_order="YMD"}
                                    </div>
                                </div>
                            </div>
                            <div class="author mt-4">
                                <label class="block font-medium mb-1 text-gray-700" for="authors">
                                    {translate key="search.author"}
                                </label>
                                {block name=searchAuthors}
                                    <input type="text" id="authors" name="authors" value="{$authors|escape}" class="border border-gray-300 rounded px-3 py-2 w-full focus:ring-2 focus:ring-primary focus:border-primary transition">
                                {/block}
                            </div>
                            {call_hook name="Templates::Search::SearchResults::AdditionalFilters"}
                        </fieldset>

                        <div class="submit flex justify-end">
                            <button class="inline-block px-6 py-2 border border-primary text-primary rounded bg-white hover:bg-primary hover:text-white font-semibold transition"
                                type="submit">{translate key="common.search"}</button>
                        </div>
                    </form>
                </div>
            </div>

            {call_hook name="Templates::Search::SearchResults::PreResults"}

            <div class="md:col-span-3">
                {if !$results|@count}
                    {* No results found *}


                    {* Results pagination *}
                {else}
                    <div class="flex justify-center mt-8">
                        <div class="prose prose-sm flex flex-col items-center w-full max-w-2xl bg-gray-50 border border-gray-200 rounded-lg px-6 py-4 shadow-sm">
                            <div class="text-gray-500 mb-2">{page_info iterator=$results}</div>
                            <nav class="flex flex-wrap gap-2 items-center justify-center prose-a:text-primary prose-a:font-semibold prose-a:no-underline prose-a:rounded prose-a:px-2 prose-a:py-1 prose-a:transition-colors prose-a:hover:bg-primary/10 prose-a:hover:text-primary-700 prose-a:focus:ring-2 prose-a:focus:ring-primary prose-a:bg-white prose-a:border prose-a:border-gray-200" aria-label="{translate key='common.pagination.label'}">
                                {page_links
                                    anchor="results"
                                    iterator=$results
                                    name="search"
                                    query=$query
                                    searchJournal=$searchJournal
                                    authors=$authors
                                    title=$title
                                    abstract=$abstract
                                    galleyFullText=$galleyFullText
                                    discipline=$discipline
                                    subject=$subject
                                    type=$type
                                    coverage=$coverage
                                    indexTerms=$indexTerms
                                    dateFromMonth=$dateFromMonth
                                    dateFromDay=$dateFromDay
                                    dateFromYear=$dateFromYear
                                    dateToMonth=$dateToMonth
                                    dateToDay=$dateToDay
                                    dateToYear=$dateToYear
                                    orderBy=$orderBy
                                    orderDir=$orderDir
                                }
                            </nav>
                        </div>
                    </div>
                {/if}
            </div>

            {* Search Syntax Instructions *}
            {block name=searchSyntaxInstructions}{/block}


        </div>
    </div>
</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
