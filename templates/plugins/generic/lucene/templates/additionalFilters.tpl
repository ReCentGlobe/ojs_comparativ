{**
 * templates/additionalFilters.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * A template to be included via Templates::Manager::Sections::SectionForm::AdditionalMetadata hook.
 *}

{if !empty($selectedFacets)}
    <div class="my-4">
        <h4 class="text-base font-semibold mb-2">{translate key="search.advancedFilters"}</h4>
        {foreach from=$selectedFacets key="facetCategory" item=value}
            {assign var = "orgValue" value = $value.facetValue }
            {assign var = $facetCategory value = ""}
            <div class="mb-2 p-2 bg-gray-50 rounded border">
                <label class="font-semibold">{$value.facetDisplayName}</label>
                <span class="ml-2">{$value.facetValue}</span>
                <a class="ml-4 text-red-600 hover:underline" href="{url query=$query journalTitle=$journalTitle authors=$authors title=$title abstract=$abstract galleyFullText=$galleyFullText discipline=$discipline subject=$subject type=$type coverage=$coverage dateFromMonth=$dateFromMonth dateFromDay=$dateFromDay dateFromYear=$dateFromYear dateToMonth=$dateToMonth dateToDay=$dateToDay dateToYear=$dateToYear escape=false}">Löschen</a>
            </div>
            {assign var=$facetCategory value=$orgValue}
        {/foreach}
    </div>
{/if}


