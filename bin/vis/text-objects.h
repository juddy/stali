#ifndef TEXT_OBJECTS_H
#define TEXT_OBJECTS_H

/* these functions all take a file position. if this position is part of the
 * respective text-object, a corresponding range is returned. if there is no
 * such text-object at the given location, an empty range is returned.
 */

#include <stddef.h>
#include "text.h"

/* return range covering the entire text */
Filerange text_object_entire(Text*, size_t pos);
/* entire document except leading and trailing empty lines */
Filerange text_object_entire_inner(Text*, size_t pos);
/* word which happens to be at pos without any neighbouring white spaces */
Filerange text_object_word(Text*, size_t pos);
/* includes trailing white spaces. if at pos happens to be a white space
 * include all neighbouring leading white spaces and the following word. */
Filerange text_object_word_outer(Text*, size_t pos);
/* find next occurance of `word' (as word not substring) in forward/backward direction */
Filerange text_object_word_find_next(Text*, size_t pos, const char *word);
Filerange text_object_word_find_prev(Text*, size_t pos, const char *word);
/* same semantics as above but for a longword (i.e. delimited by white spaces) */
Filerange text_object_longword(Text*, size_t pos);
Filerange text_object_longword_outer(Text*, size_t pos);

Filerange text_object_line(Text*, size_t pos);
Filerange text_object_line_inner(Text*, size_t pos);
Filerange text_object_sentence(Text*, size_t pos);
Filerange text_object_paragraph(Text*, size_t pos);

/* C like function definition */
Filerange text_object_function(Text*, size_t pos);
/* inner variant only contains the function body */
Filerange text_object_function_inner(Text*, size_t pos);
/* these are inner text objects i.e. the delimiters themself are not
 * included in the range */
Filerange text_object_square_bracket(Text*, size_t pos);
Filerange text_object_curly_bracket(Text*, size_t pos);
Filerange text_object_angle_bracket(Text*, size_t pos);
Filerange text_object_paranthese(Text*, size_t pos);
Filerange text_object_quote(Text*, size_t pos);
Filerange text_object_single_quote(Text*, size_t pos);
Filerange text_object_backtick(Text*, size_t pos);
/* text object delimited by arbitrary chars for which isboundary returns non-zero */
Filerange text_object_range(Text*, size_t pos, int (*isboundary)(int));
/* a number in either decimal, hex or octal format */
Filerange text_object_number(Text*, size_t pos);
Filerange text_object_filename(Text*, size_t pos);
/* match a search term in either forward or backward direction */
Filerange text_object_search_forward(Text*, size_t pos, Regex*);
Filerange text_object_search_backward(Text*, size_t pos, Regex*);
/* match all lines with same indendation level than the current one */
Filerange text_object_indentation(Text*, size_t pos);

/* extend a range to cover whole lines */
Filerange text_range_linewise(Text*, Filerange*);
/* trim leading and trailing white spaces from range */
Filerange text_range_inner(Text*, Filerange*);
/* test whether a given range covers whole lines */
bool text_range_is_linewise(Text*, Filerange*);

#endif
