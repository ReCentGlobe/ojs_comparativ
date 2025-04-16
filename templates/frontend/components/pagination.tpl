{**
 * templates/frontend/components/pagination.tpl
 *
 * Copyright (c) 2014-2018 Simon Fraser University
 * Copyright (c) 2003-2018 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common template for displaying pagination
 *
 * @uses $prevUrl string URL to the previous page
 * @uses $nextUrl string URL to the next page
 * @uses $showingStart int The number of the first item shown on this page
 * @uses $showingEnd int The number of the last item shown on this page
 * @uses $total int The total number of items available
 *}

{if $prevUrl || $nextUrl}
  <ul class="flex items-center justify-center space-x-4 text-sm" aria-label="{translate|escape key="common.pagination.label"}">
    {if $prevUrl}
      <li>
       <a href="{$prevUrl}" class="inline-flex items-center px-3 py-1 rounded bg-gray-100 hover:bg-primary hover:text-white transition-colors">
         <span class="mr-2">&#8592;</span>{translate key="help.previous"}
       </a>
      </li>
    {/if}
    <span class="current font-semibold text-primary">
			{translate key="common.pagination" start=$showingStart end=$showingEnd total=$total}
		</span>
    {if $nextUrl}
      <li>
        <a href="{$nextUrl}" class="inline-flex items-center px-3 py-1 rounded bg-gray-100 hover:bg-primary hover:text-white transition-colors">
          {translate key="help.next"}<span class="ml-2">&#8594;</span>
        </a>
      </li>
    {/if}
  </ul>
{/if}
