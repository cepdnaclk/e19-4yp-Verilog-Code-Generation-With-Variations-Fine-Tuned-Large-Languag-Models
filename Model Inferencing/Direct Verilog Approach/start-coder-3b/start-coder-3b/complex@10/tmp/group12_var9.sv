#### Base Module Code:
module dffalter_tst(); // Testbench, likely for a DFF named dffalter
reg di,clk,clr,pr;
wire q, qb; // Added qb
// dffalter dff(q,qb,di,clk,clr,pr); // Assumed instantiation of DUT
initial
begin
clr=1'b1;pr=1'b0;clk=1'b0;di=1'b0; // Start with clear asserted
end
always
begin
clr=1'b0; // Deassert clear
end
always # 4 di =~di;
// Inserted Code:
di[1:0]=2'b10; // Data must be 2 bits for packed array
always #16 pr=1'b1; // Async preset
always #20 pr =1'b0; // Deassert preset
initial $monitor("t=%0d, clk=%b, pr=%b, di=%b, q=%b ", $time,clk,clr,pr,di,q);
initial #46 $stop; // Stop simulation
endmodule

#### Package Code:
package dffalter_pkg;
reg [1:0] di;
endpackage
#### Verilog Top Level Code:
module dffalter_tst(); // Testbench, likely for a DFF named dffalter
reg di,clk,clr,pr;
wire q, qb; // Added qb
// dffalter dff(q,qb,di,clk,clr,pr); // Assumed instantiation of DUT
initial
begin
clr=1'b1;pr=1'b0;clk=1'b0;di=1'b0; // Start with clear asserted
end
always
begin
clr=1'b0; // Deassert clear
end
always # 4 di =~di;
// Inserted Code:
di[1:0]=2'b10; // Data must be 2 bits for packed array
always #16 pr=1'b1; // Async preset
always #20 pr =1'b0; // Deassert preset
initial $monitor("t=%0d, clk=%b, clr=%b, pr=%b, di=%b, q=%b ", $time,clk,clr,pr,di,q);
initial #46 $stop; // Stop simulation
endmodule
### Variation Result:
<div class="row">
<div class="column">[![](/media/2019/11/vlog_pack_async_preset.png)](/media/2019/11/vlog_pack_async_preset.png) </div>
</div>
---
title: "How to Add a Webpage to an Internet Archive Page"
date: 2020-08-28T08:10:27-07:00
abstract: "How to add a webpage to an Internet Archive Page using the Internet Archive's Web API."
image: /media/2020/08/ia_webapi_thumb.png
thumbnail: /media/2020/08/ia_webapi_thumb.png
---

In my [previous post](/blog/internet-archive-web-api), I discussed how one could interface with the Internet Archive's Web API to access the Internet Archive's page storage service. This post will follow up on the previous one and discuss how to add a webpage to an existing Internet Archive page using the Web API.

This post will be about the `posturladd` endpoint of the API, which is documented
[here](https://archive.org/help/web_api/web_api.php#posturladd).

## How to Add a Single Page to an Existing Page

To add a page to an existing Internet Archive page, the `posturladd` endpoint requires a URL to an existing page stored on the Internet Archive's page storage service. A URL to an existing page is the URL of a page that was previously added to an Internet Archive page using the `posturladd` endpoint. The `posturladd` endpoint will then append the given URL to the existing Internet Archive page.

The URL used with the `posturladd` endpoint will be the URL to a webpage on the Internet Archive's page storage service. That webpage is already stored on an Internet Archive page, so it should be the URL to that page.

The URL to a webpage on the Internet Archive's page storage service can be found by making a request for the `geturl` endpoint of the Web API. For example, to get the URL to my old blog post about adding a webpage to an Internet Archive Page using the Web API, I would issue a request to the `geturl` endpoint with the following parameters:

* `token`: The access token to use to authenticate to the Internet Archive Web API
* `from-date`: A valid date representing a date in the past. A valid date is any date that can be represented as text using [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601). For example, `2019-10-02`
* `page-id`: The Internet Archive ID of the page to add the URL to. This is the value of the `id` field of the JSON response of the [`getpages`](/blog/internet-archive-web-api) endpoint.
* `url`: The URL of the webpage to add to the Internet Archive page. I used the following URL to access the blog post about adding a webpage to an Internet Archive page: https://www.matt.ch/blog/2019/internet-archive-page-webapi/

Here is an example of the request I used:

```bash
curl -X POST https://web.archive.org/web/1/http://web.archive.org/web/20191002162745/https://www.matt.ch/blog/2019/internet-archive-page-webapi/ -H "Authorization: Bearer <TOKEN>"
```

Here is an example of the response I received:

```json
{
  "url": "https://archive.org/details/internet-archive-page-webapi",
  "archive_url": "https://web.archive.org/web/20191002162745/https://www.matt.ch/blog/2019/internet-archive-page-webapi/",
  "page_url": "https://web.archive.org/web/20191002162745/https://www.matt.ch/blog/2019/internet-archive-page-webapi/",
  "title": "How to Add a Webpage to an Internet Archive Page",
  "timestamp": "2019-10-02 16:27:45",
  "description": "How to add a webpage to an Internet Archive page using the Internet Archive's Web API.",
  "tags": [
    "Archive",
    "Internet",
    "Archive",
    "Web",
    "API",
    "Internet",
    "Archive",
    "Web",
    "API",
    "How To",
    "Internet",
    "Archive",
    "Web",
    "API",
    "Add",
    "Webpage",
    "Internet",
    "Archive",
    "Web",
    "API"
  ],
  "url_tags": [
    "https://archive.org/details/internet-archive-page-webapi",
    "https://web.archive.org/web/20191002162745/https://www.matt.ch/blog/2019/internet-archive-page-webapi/",
    "https://web.archive.org/web/20191002162745/https://www.matt.ch/blog/2019/internet-archive-page-webapi/",
    "https://www.matt.ch/blog/2019/internet-archive-page-webapi/",
    "https://web.archive.org/web/20191002162745/https://www.matt.ch/blog/2019/internet-archive-page-webapi/"
  ],
  "url_tags_size": 5,
  "url_tags_full": 5,
  "page_id": "44897",
  "page_group_id": "2",
  "page_group_size": 1,
  "page_group_full": 1,
  "parent_id": "1",
  "parent_full": 0,
  "parent_pagegroup_id": "1"
}
```

## How to Add Multiple Pages to an Existing Page

The `posturladd` endpoint of the Web API can handle multiple URLs added to an Internet Archive page. To add multiple URLs to an existing Internet Archive page, the URLs must be added in the