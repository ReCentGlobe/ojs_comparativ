{**
 * templates/frontend/components/sectionHeader.tpl
 *
 * @param string $breadcrumbs Rendered breadcrumbs HTML
 * @param string $title The main title
 * @param string $subtitle The subtitle (optional)
 * @param array $authors List of authors (optional)
 * @param string $orcidIcon ORCID icon HTML (optional)
 *}
<section class="bg-primary py-14">
  <div class="container mx-auto">
    {if $breadcrumbs}
      <div class="mb-2">
        {$breadcrumbs}
      </div>
    {/if}
    {if $title}
      <h1 class="text-4xl md:text-5xl font-serif font-base text-white mb-1 animate-fadeIn">
        {$title}
      </h1>
    {/if}
    {if $subtitle}
      <h2 class="text-lg md:text-xl font-sans font-medium text-blue-100 mb-0 animate-fadeIn">
        {$subtitle}
      </h2>
    {/if}
    {if $authors}
      <ul class="flex flex-wrap gap-4 item authors mt-4 animate-fadeIn">
        {foreach from=$authors item=author}
          <li class="inline-flex items-center gap-2">
            <span class="name font-medium text-white">{$author->getFullName()|escape}</span>
            {if $author->getLocalizedAffiliation()}
              <span class="affiliation text-xs text-blue-100 ml-2">{$author->getLocalizedAffiliation()|escape}</span>
            {/if}
            {if $author->getOrcid()}
              <span class="orcid text-xs text-accent ml-2">
                {if $orcidIcon}{$orcidIcon}{/if}
                <a href="{$author->getOrcid()|escape}" target="_blank">{$author->getOrcid()|escape}</a>
              </span>
            {/if}
          </li>
        {/foreach}
      </ul>
    {/if}
  </div>
</section>
