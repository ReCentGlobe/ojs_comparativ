{**
 * templates/facetsBlock.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Faceted search results navigation block.
 *}

<div class="pkp_block block_lucene_facets" id="lucene_facets">
	<span class="block text-lg font-semibold mb-2">{translate key="plugins.generic.lucene.faceting.title"}</span>
	<div class="content">
        <ul class="block_lucene_facets_facets divide-y">
		    {foreach from=$facets key="facetCategory" item="facetList"}
			{if count($facetList)}
                <li class="block_lucene_facets_facet py-2">
                <a class="lucenetoggle flex items-center gap-2 cursor-pointer" href="javascript:void(0);">
                    <span class="fa fa-plus"></span>
                    <span>{translate key="plugins.generic.lucene.faceting."|concat:$facetCategory}</span>
                </a>
                        <ul class="inner ml-4 mt-2">
                        {foreach from=$facetList key="facet" item="facetCount"}
                            <li class="py-1">
                                <a class="text-primary hover:underline" href="{url query=$query journalTitle=$journalTitle authors=$authors title=$title abstract=$abstract galleyFullText=$galleyFullText discipline=$discipline subject=$subject type=$type coverage=$coverage dateFromMonth=$dateFromMonth dateFromDay=$dateFromDay dateFromYear=$dateFromYear dateToMonth=$dateToMonth dateToDay=$dateToDay dateToYear=$dateToYear escape=false}">
                                        {$facet|escape}
                                </a> <span class="text-xs text-gray-500">({$facetCount})</span>
                            </li>
                        {/foreach}
                        </ul>
                </li>
			{/if}
		    {/foreach}
        </ul>
	</div>
</div>
