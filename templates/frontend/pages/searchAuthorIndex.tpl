{**
 * templates/frontend/pages/searchAuthorIndex.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Index of published articles by author.
 *
 *}
{strip}
    {assign var="pageTitle" value="search.authorIndex"}
    {include file="frontend/components/header.tpl"}
{/strip}

<p class="mb-4 flex flex-wrap gap-2 text-sm">
{foreach from=$alphaList item=letter}<a
    href="{url op="authors" searchInitial=$letter}" class="px-2 py-1 rounded border border-gray-300 hover:bg-gray-100 {if $letter == $searchInitial}bg-primary text-white border-primary{/if}">{if $letter == $searchInitial}
        <strong>{$letter|escape}</strong>{else}{$letter|escape}{/if}</a> {/foreach}<a
            href="{url op="authors"}" class="px-2 py-1 rounded border border-gray-300 hover:bg-gray-100 {if $searchInitial==''}bg-primary text-white border-primary{/if}">{if $searchInitial==''}
            <strong>{translate key="common.all"}</strong>{else}{translate key="common.all"}{/if}</a></p>

<div id="authors" class="max-w-3xl mx-auto py-8">
    {foreach from=$authors item=author}
        {assign var=lastFirstLetter value=$firstLetter}
        {assign var=firstLetter value=$author->getLastName()|String_substr:0:1}

        {if $lastFirstLetter|lower != $firstLetter|lower}
            <div id="{$firstLetter|escape}">
                <h3 class="text-lg font-bold mt-6 mb-2">{$firstLetter|escape}</h3>
            </div>
        {/if}

        {assign var=lastAuthorName value=$authorName}
        {assign var=lastAuthorCountry value=$authorCountry}

        {assign var=authorAffiliation value=$author->getLocalizedAffiliation()}
        {assign var=authorCountry value=$author->getCountry()}

        {assign var=authorFirstName value=$author->getFirstName()}
        {assign var=authorMiddleName value=$author->getMiddleName()}
        {assign var=authorLastName value=$author->getLastName()}
        {assign var=authorName value="$authorLastName, $authorFirstName"}

        {if $authorMiddleName != ''}{assign var=authorName value="$authorName $authorMiddleName"}{/if}
        {strip}
            <a href="{url op="authors" path="view" firstName=$authorFirstName middleName=$authorMiddleName lastName=$authorLastName affiliation=$authorAffiliation country=$authorCountry}" class="text-primary hover:underline font-medium">{$authorName|escape}</a>
            {if $authorAffiliation}, <span class="text-xs text-gray-600">{$authorAffiliation|escape}</span>{/if}
            {if $lastAuthorName == $authorName && $lastAuthorCountry != $authorCountry}
                {* Disambiguate with country if necessary (i.e. if names are the same otherwise) *}
                {if $authorCountry} <span class="text-xs text-gray-500">({$author->getCountryLocalized()})</span>{/if}
            {/if}
        {/strip}
        <br/>
    {/foreach}
    {if $authors|@count}
        <br/>
        <div class="mt-4">
            {page_info iterator=$authors}&nbsp;&nbsp;&nbsp;&nbsp;{page_links anchor="authors" iterator=$authors name="authors" searchInitial=$searchInitial}
        </div>
    {else}
    {/if}
</div>
{include file="frontend/components/footer.tpl"}

