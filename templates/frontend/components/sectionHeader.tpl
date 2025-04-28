{**
 * templates/frontend/components/sectionHeader.tpl
 *
 * @param string $breadcrumbs Rendered breadcrumbs HTML
 * @param string $title The main title
 * @param string $subtitle The subtitle (optional)
 * @param array $authors List of authors (optional)
 * @param string $orcidIcon ORCID icon HTML (optional)
 *}
<section class="bg-primary py-10 md:py-14">
  <div class="container max-w-7xl mx-auto px-4 md:px-0">
    {if $breadcrumbs}
      <div class="mb-2">
        {$breadcrumbs}
      </div>
    {/if}
    {if $title}
      <h1 class="text-2xl sm:text-3xl md:text-5xl font-serif font-base text-white mb-1 animate-fadeIn break-words">
        {$title}
      </h1>
    {/if}
    {if $subtitle}
      <h2 class="text-base sm:text-lg md:text-xl font-sans font-medium text-blue-100 mb-0 animate-fadeIn break-words">
        {$subtitle}
      </h2>
    {/if}
    {if $authors}
      <ul class="flex flex-col sm:flex-row flex-wrap gap-2 sm:gap-4 item authors mt-4 animate-fadeIn">
        {foreach from=$authors item=author}
          <li class="inline-flex items-center gap-2">
            <span class="inline-block text-accent">
              <!-- Caret icon SVG -->
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 1024 1024"><path fill="currentColor" d="M271.653 1023.192c-8.685 0-17.573-3.432-24.238-10.097c-13.33-13.33-13.33-35.144 0-48.474L703.67 508.163L254.08 58.573c-13.33-13.331-13.33-35.145 0-48.475s35.143-13.33 48.473 0L776.38 483.925c13.33 13.33 13.33 35.143 0 48.473l-480.492 480.694c-6.665 6.665-15.551 10.099-24.236 10.099z"/></svg>
            </span>
            <span class="name font-medium text-white">{$author->getFullName()|escape}</span>
            {if $author->getLocalizedAffiliation()}
              <span class="affiliation text-xs text-blue-100 ml-2">{$author->getLocalizedAffiliation()|escape}</span>
            {/if}
            {if $author->getOrcid()}
              <span class="orcid text-xs ml-2">
                {if $orcidIcon}
                  <a href="{$author->getOrcid()|escape}" target="_blank" class="inline-block align-middle text-white hover:text-accent focus:text-accent transition-colors">
                    <span class="block sm:hidden">{$orcidIcon}</span>
                    <span class="hidden sm:inline">{$orcidIcon} <span class="underline">{$author->getOrcid()|escape}</span></span>
                  </a>
                {else}
                  <a href="{$author->getOrcid()|escape}" target="_blank" class="text-white underline hover:text-accent focus:text-accent transition-colors">
                    <span class="block sm:hidden">ORCID</span>
                    <span class="hidden sm:inline">{$author->getOrcid()|escape}</span>
                  </a>
                {/if}
              </span>
            {/if}
          </li>
        {/foreach}
      </ul>
    {/if}
  </div>
</section>
