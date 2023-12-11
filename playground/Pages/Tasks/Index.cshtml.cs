using Microsoft.AspNetCore.Mvc.RazorPages;

namespace playground.Pages.Tasks;

public class IndexModel : PageModel
{
    public List<TaskViewModel> Tasks { get; set; } = Enumerable.Empty<TaskViewModel>().ToList();

    public async Task OnGetAsync()
    {
        Tasks = new List<TaskViewModel> {
            new TaskViewModel { Id = Guid.NewGuid(), Name = "Task 1" },
            new TaskViewModel { Id = Guid.NewGuid(), Name = "Task 2" },
            new TaskViewModel { Id = Guid.NewGuid(), Name = "Task 3" },
        };
    }
}
