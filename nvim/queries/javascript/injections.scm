; Inject CSS inside JSX style={ ` ... ` }
((jsx_attribute
   (property_identifier) @prop
   (jsx_expression
     (template_string) @injection.content))
  (#eq? @prop "style")
  (#set! injection.language "css"))


