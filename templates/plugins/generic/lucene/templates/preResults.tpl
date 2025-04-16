{**
 * templates/preResults.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * A template to be included via Templates::Search::SearchResults::PreResults hook.
 *}
<div id="luceneSpellingsuggestions" class="mb-4 text-sm text-gray-700">
{if !empty($spellingSuggestion)}
	<strong>{translate key="plugins.generic.lucene.results.didYouMean"}: <a class="text-primary hover:underline" href="{url op="search" params=$spellingSuggestionUrlParams}">{$spellingSuggestion}</a></strong>
{/if}
</div>

<div id="luceneOrdering" class="mb-4 flex items-center gap-2">
    <span>{translate key="plugins.generic.lucene.results.orderBy"}:</span>
    <select id="luceneSearchOrder" name="luceneOrderBy" class="border rounded px-2 py-1">
        {html_options options=$luceneOrderByOptions selected=$orderBy}
    </select>
    <select id="luceneSearchDirection" name="luceneOrderDir" class="border rounded px-2 py-1">
        {html_options options=$luceneOrderDirOptions selected=$orderDir}
    </select>
</div>
<script type="text/javascript">
    // Get references to the required elements.
    document.addEventListener("DOMContentLoaded", function(event) {ldelim}


        var $orderBySelect = $('#luceneSearchOrder');
        var $orderDirSelect = $('#luceneSearchDirection');

        function luceneReorder(useDefaultOrderDir) {ldelim}
            var reorderUrl = '{strip}
            {url query=$query searchJournal=$searchJournal
                authors=$authors title=$title abstract=$abstract galleyFullText=$galleyFullText suppFiles=$suppFiles
                discipline=$discipline subject=$subject type=$type coverage=$coverage
                dateFromMonth=$dateFromMonth dateFromDay=$dateFromDay dateFromYear=$dateFromYear
                dateToMonth=$dateToMonth dateToDay=$dateToDay dateToYear=$dateToYear escape=false}
            {/strip}';
            var orderBy = $orderBySelect.val();
            if (useDefaultOrderDir) {ldelim}
                var orderDir = '';
                {rdelim} else {ldelim}
                var orderDir = $orderDirSelect.val();
                {rdelim}
            reorderUrl += '&orderBy=' + orderBy + '&orderDir=' + orderDir;
            window.location = reorderUrl;
            {rdelim}
        $orderBySelect.change(function() {ldelim} luceneReorder(true); {rdelim});
        $orderDirSelect.change(function() {ldelim} luceneReorder(false); {rdelim});
        {rdelim});
</script>
