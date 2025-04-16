{**
 * templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common site frontend footer.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}



</div><!-- pkp_structure_content -->

<footer id="pkp_content_footer" class="bg-primary text-white py-12" role="contentinfo">
  <div class="container mx-auto">
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
      <div>
        <h3 class="text-lg font-bold uppercase mb-4">About Us</h3>
        {load_menu name="footer" id="" ulClass="space-y-2" liClass="text-white hover:text-accent transition-colors"}
      </div>
      <div>
        <h3 class="text-lg font-bold uppercase mb-4">Sections</h3>
        {load_menu name="footer2" id="" ulClass="space-y-2" liClass="text-white hover:text-accent transition-colors"}
      </div>
      <div>
        <h3 class="text-lg font-bold uppercase mb-4">Subscriptions</h3>
        {load_menu name="footer3" id="" ulClass="space-y-2" liClass="text-white hover:text-accent transition-colors"}
      </div>
      <div role="complementary">
        <h3 class="text-lg font-bold uppercase mb-4">Legal Notices</h3>
        <div class="mb-4 max-w-xl text-gray-300">
          {$pageFooter}
        </div>
        {load_menu name="footer4" id="" ulClass="space-y-2" liClass="text-white hover:text-accent transition-colors"}
      </div>
    </div>
  </div>
</footer><!-- pkp_structure_footer_wrapper -->

</div><!-- pkp_structure_page -->

{load_script context="frontend"}

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>
