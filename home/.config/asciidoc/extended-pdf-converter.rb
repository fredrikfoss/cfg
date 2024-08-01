class PDFConverterArticleTitleWithAuthorAndDate < (Asciidoctor::Converter.for 'pdf')
  register_for 'pdf'

  def ink_general_heading doc, title, opts
    return super unless opts[:role] == :doctitle
    ink_document_title title, opts
    ink_document_details doc, opts
    margin_bottom @theme[:heading_h1_margin_bottom] || @theme.heading_margin_bottom
  end

  def ink_document_title title, opts
    if (top_margin = @theme.heading_h1_margin_page_top || @theme.heading_margin_page_top) > 0
      move_down top_margin
    end
    pad_box @theme.heading_h1_padding do
      if (transform = resolve_text_transform opts)
        title = transform_text title, transform
      end
      if (inherited = apply_text_decoration font_styles, :heading, 1).empty?
        inline_format_opts = true
      else
        inline_format_opts = [{ inherited: inherited }]
      end
      typeset_text_opts = { color: @font_color, inline_format: inline_format_opts }.merge opts
      typeset_text title, (calc_line_metrics (opts.delete :line_height) || @base_line_height), typeset_text_opts
    end
  end

  def ink_document_details doc, opts
    revnumber = doc.attr 'revnumber'
    if doc.authors.any? || doc.revdate || revnumber
      move_down @theme.heading_h1_details_margin_top || 0
      theme_font_cascade [:base, :heading_h1_details] do
        # Join all author names with a separator
        all_authors = doc.authors.map(&:name).join(', ')
        author_date_separator = all_authors && doc.revdate ? %( #{EmDash} ) : ''
        revision = (doc.attr? 'revremark') ? %(#{revnumber} | #{doc.attr 'revremark'}) : revnumber if revnumber
        revision_separator = revision && (all_authors || doc.revdate) ? %( #{EmDash} ) : ''
        ink_prose %(#{all_authors}#{author_date_separator}#{doc.revdate}#{revision_separator}#{revision}), align: opts[:align]
      end
    end
  end
end
