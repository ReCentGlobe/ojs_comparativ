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


<section class="bg-primary py-8">
    <div class="container mx-auto animate-fadeIn">
        {include file="frontend/components/breadcrumbs.tpl" currentTitleKey="common.search"}
        <h1 class="text-2xl font-bold text-white mt-0">Search</h1>
    </div>
</section>

<section class="bg-white py-12">
    <div class="container mx-auto">
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
                        <article class="mb-8 bg-gray-50 p-4 rounded shadow">
                            {include file="frontend/objects/article_search.tpl" article=$result.publishedSubmission journal=$result.journal issue=$result.issue showDatePublished=true hideGalleys=true}
                            <hr>
                        </article>
                        {/iterate}
                    {/if}

                </div>
            </div>

            <div>
                <h4 class="text-lg font-semibold mb-4 border-b border-gray-200 pb-2">Search Filter</h4>
                {capture name="searchFormUrl"}{url escape=false}{/capture}
                {assign var=formUrlParameters value=[]}{* Prevent Smarty warning *}
                {$smarty.capture.searchFormUrl|parse_url:$smarty.const.PHP_URL_QUERY|parse_str:$formUrlParameters}
                <form class="space-y-4" method="get"
                    action="{$smarty.capture.searchFormUrl|strtok:"?"|escape}">
                    {foreach from=$formUrlParameters key=paramKey item=paramValue}
                        <input type="hidden" name="{$paramKey|escape}" value="{$paramValue|escape}" />
                    {/foreach}
                    {csrf}

                    <div class="search_input mb-4">
                        <label class="block font-semibold mb-1" for="query">
                            {translate key="search.searchFor"}
                        </label>
                        {block name=searchQuery}
                            <input type="text" id="query" name="query" value="{$query|escape}" class="border rounded px-3 py-2 w-full"
                                placeholder="{translate|escape key="common.search"}">
                        {/block}
                    </div>

                    <fieldset class="search_advanced mb-4">
                        <legend class="font-semibold mb-2">{translate key="search.advancedFilters"}</legend>
                        <div class="date_range flex gap-4">
                            <div class="from">
                                <label class="block font-medium mb-1">
                                    {translate key="search.dateFrom"}
                                </label>
                                {html_select_date class="border rounded px-2 py-1" prefix="dateFrom" time=$dateFrom start_year=$yearStart end_year=$yearEnd year_empty="" month_empty="" day_empty="" field_order="YMD"}
                            </div>
                            <div class="to">
                                <label class="block font-medium mb-1">
                                    {translate key="search.dateTo"}
                                </label>
                                {html_select_date class="border rounded px-2 py-1" prefix="dateTo" time=$dateTo start_year=$yearStart end_year=$yearEnd year_empty="" month_empty="" day_empty="" field_order="YMD"}
                            </div>
                        </div>
                        <div class="author mt-4">
                            <label class="block font-medium mb-1" for="authors">
                                {translate key="search.author"}
                            </label>
                            {block name=searchAuthors}
                                <input type="text" id="authors" name="authors" value="{$authors|escape}" class="border rounded px-3 py-2 w-full">
                            {/block}
                        </div>
                        {call_hook name="Templates::Search::SearchResults::AdditionalFilters"}
                    </fieldset>

                    <div class="submit">
                        <button class="inline-block px-4 py-2 border border-primary text-primary rounded hover:bg-primary hover:text-white transition"
                            type="submit">{translate key="common.search"}</button>
                    </div>
                </form>
            </div>

            {call_hook name="Templates::Search::SearchResults::PreResults"}

            <div class="md:col-span-3">
                {if !$results|@count}
                    {* No results found *}


                    {* Results pagination *}
                {else}
                    <div class="flex justify-center mt-8">
                        {page_info iterator=$results}
                        {page_links anchor="results" iterator=$results name="search" query=$query searchJournal=$searchJournal authors=$authors title=$title abstract=$abstract galleyFullText=$galleyFullText discipline=$discipline subject=$subject type=$type coverage=$coverage indexTerms=$indexTerms dateFromMonth=$dateFromMonth dateFromDay=$dateFromDay dateFromYear=$dateFromYear dateToMonth=$dateToMonth dateToDay=$dateToDay dateToYear=$dateToYear orderBy=$orderBy orderDir=$orderDir}
                    </div>
                {/if}
            </div>

            {* Search Syntax Instructions *}
            {block name=searchSyntaxInstructions}{/block}


        </div>
    </div>
</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
