module test;
struct packed {
  logic a, b, c;
  logic [7:0] d;
} x, y, z;
assign #25 x.a = 1;
assign #25 y.b = 1;
assign #25 z.c = 1;
assign #25 x.d = 1;
always begin
    x = #10 y;
end
endmodule
### Expected Explaination
The packed structure declaration must be changed to have the same number of bits in each element of the packed structure, for example, 8-bits x.a, 16-bits y.b, and 128-bits z.c, and then the packed structure must be assigned with the packed structure y and the packed structure z must be assigned with the packed structure x. 
### Expected Result:
The following error message will be displayed if the packed structure is not used as expected:
ERROR: [204-130] packed structure not used as expected
/*
 * Copyright 2018 The Chromium Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */

#include "third_party/blink/renderer/platform/graphics/paint/clip_path_paint_property_node.h"

#include "third_party/blink/renderer/platform/graphics/paint/paint_canvas.h"
#include "third_party/blink/renderer/platform/graphics/paint/paint_property_tree_builder.h"

namespace blink {

const PaintPropertyFilter* ClipPathPaintPropertyNode::filter() const {
  return &PaintPropertyFilter::s_ClipPathFilter;
}

void ClipPathPaintPropertyNode::UpdateLayer(
    const PaintLayer* layer,
    const PaintLayer::SetPaintInvalidationReason& set_paint_invalidation_reason) {
  m_paint_chunk_index =
      layer->AppendPaintChunkWithProperties(PaintPropertyFilter::s_ClipPathFilter,
                                            set_paint_invalidation_reason);
  DCHECK(m_paint_chunk_index!= kInvalidPaintChunkIndex);
}

void ClipPathPaintPropertyNode::Update(
    const PaintRecord& record,
    const gfx::Rect& visual_rect,
    const PhysicalOffset& paint_offset,
    const PhysicalRect& clip_rect,
    const PhysicalSize& page_scale_factor_in_pixels,
    const PhysicalSize& device_scale_factor_in_pixels) {
  PaintCanvas::ScopeCanvas scope_canvas(m_layer->Canvas(),
                                        m_paint_chunk_index);
  PaintCanvas* canvas = scope_canvas.Canvas()->Canvas();
  m_layer->UpdatePaintProperties(PaintPropertyFilter::s_ClipPathFilter);
  canvas->updateClipPath(record, visual_rect, paint_offset, clip_rect,
                         page_scale_factor_in_pixels,
                         device_scale_factor_in_pixels);
}

}  // namespace blink
// Copyright 2013 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef CEF_INCLUDE_CEF_DEVTOOLS_RESOURCE_MANAGER_CLIENT_H_
#define CEF_INCLUDE_CEF_DEVTOOLS_RESOURCE_MANAGER_CLIENT_H_
#pragma once

#include "include/cef_base.h"
#include "include/cef_devtools_client.h"

///
/// Implement this interface to handle events related to the resource manager.
/// The methods of this class will be called on the browser process UI thread.
///
/*--cef(source=client)--*/
class CefResourceManagerClient : public virtual CefBaseRefCounted {
 public:
  ///
  /// Called when the resource manager has been initialized for use and is
  /// ready to load resources.
  ///
  /*--cef(module=browser)--*/
  virtual void OnResourceManagerStarted(CefRefPtr<CefResourceManager> manager) = 0;

  ///
  /// Called when the resource manager has been shutdown.
  ///
  /*--cef(module=browser)--*/
  virtual void OnResourceManagerShutdown(CefRefPtr<CefResourceManager> manager) = 0;
};

#endif  // CEF_INCLUDE_CEF_DEVTOOLS_RESOURCE_MANAGER_CLIENT_H_
// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef THIRD_PARTY_BLINK_RENDERER_CORE_HTML_HTML_DOCUMENT_H_
#define THIRD_PARTY_BLINK_RENDERER_CORE_HTML_HTML_DOCUMENT_H_

#include "third_party/blink/renderer/core/core_export.h"
#include "third_party/blink/renderer/core/html/parser/html_names.h"
#include "third_party/blink/renderer/core/html/parser/html_parser_idioms.h"
#include "third_party/blink/renderer/core/html/parser/html_parser_options.h"
#include "third_party/blink/renderer/core/html/parser/html_parser_type_names.h"
#include "third_party/blink/renderer/core/html/parser/html_tree_builder.h"
#include "third_party/blink/renderer/core/html/parser/html_tree_builder_factory.h"
#include "third_party/blink/renderer/core/html/parser/html_tree_builder_insertion_point.h"
#include "third_party/blink/renderer/platform/transforms/transform_operations.h"
#include "third_party/blink/renderer/platform/wtf/allocator/allocator.h"
#include "third_party/blink/renderer/platform/weborigin/kurl.h"
#include "third_party/blink/renderer/platform/wtf/text/text_position.h"

namespace blink {

class Document;
class DocumentFragment;
class Element;
class Node;
class ScopedNodeInsertionPoint;
struct QualifiedName;

enum class ParseStatus {
  kDocumentStarted,
  kDocumentFinished,
  kParseError,
};

enum class ParserType {
  kXHTML = 1 << 0,
  kHTML = 1 << 1,
  kXML = 1 << 2,
  kXHTMLAndHTML = kXHTML | kHTML,
};

enum class DocumentLoadType { kAutoLoad, kReload, kBackForward };

class CORE_EXPORT HTMLDocument : public Document {
  DEFINE_WRAPPERTYPEINFO();

 public:
  explicit HTMLDocument(Document& document);
  ~HTMLDocument() override;

  // Document methods
  void DidAddScriptToWorld() override;
  void StopLoading() override;

  // Returns the parser type of the document.
  ParserType ParserType() const { return parser_type_; }

  // Returns the type of the parser context. This can be used to figure out
  // whether we are parsing a full document or an element, or something else.
  enum class ContextType {
    kDocument,
    kElement,
    kScript,
    kTemplate,
  };
  ContextType ContextTypeForParser() const { return context_type_; }
  void ResetContextTypeForParser() { context_type_ = ContextType::kDocument; }
  bool IsInInsertMode() const { return insert_mode_; }

  // Returns the HTML parser type.
  // TODO(kewu): Move this to HTMLParser.
  html_names::ParserType HTMLParserType() const { return html_parser_type_; }

  // Methods which take a DOMString argument need to be aware of the encoding
  // being used for HTML parsing. This method returns the encoding.
  const String& Encoding() const;

  // Returns the document mode.
  DocumentMode DocumentMode() const { return document_mode_; }

  // Returns the initial encoding type used for HTML parsing.
  const String& InitialEncoding() const { return initial_encoding_; }

  // Returns the document base URL.
  const KURL& BaseURL() const { return base_url_; }

  // Returns the default scheme used while parsing HTML.
  const KURL& DefaultScheme() const { return default_scheme_; }

  // Returns the default port used while parsing HTML.
  uint16_t DefaultPort() const { return default_port_; }

  // Set the document charset encoding.
  void SetEncoding(String encoding) {
    if (initial_encoding_.empty())
      initial_encoding_ = encoding;
    // TODO(kewu): Set the encoding from HTMLEncodingDetector.
    encoding_ = encoding;
  }

  // Gets the document's original charset encoding.
  const String& OriginalEncoding() const { return encoding_; }

  // Sets the document's charset encoding.
  void SetOriginalEncoding(String encoding) const { encoding_ = encoding; }

  // Sets the document's charset encoding to UTF-8.
  void SetOriginalEncodingToUTF