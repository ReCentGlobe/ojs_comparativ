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
  <nav aria-label="{translate|escape key="common.pagination.label"}">
    <ul class="flex items-center justify-center gap-4 text-sm bg-gray-50 border border-gray-200 rounded-lg px-4 py-2 shadow-sm">
      {if $prevUrl}
        <li>
          <a href="{$prevUrl}" class="inline-flex items-center px-4 py-2 rounded-full bg-white border border-gray-300 text-gray-600 hover:bg-primary hover:text-white focus:ring-2 focus:ring-primary transition-colors font-semibold">
            <span class="mr-2">&#8592;</span>{translate key="help.previous"}
          </a>
        </li>
      {/if}
      <li>
        <span class="current font-semibold text-primary bg-primary/10 px-3 py-1 rounded-full">
          {translate key="common.pagination" start=$showingStart end=$showingEnd total=$total}
        </span>
      </li>
      {if $nextUrl}
        <li>
          <a href="{$nextUrl}" class="inline-flex items-center px-4 py-2 rounded-full bg-white border border-gray-300 text-gray-600 hover:bg-primary hover:text-white focus:ring-2 focus:ring-primary transition-colors font-semibold">
            {translate key="help.next"}<span class="ml-2">&#8594;</span>
          </a>
        </li>
      {/if}
    </ul>
  </nav>
{/if}
